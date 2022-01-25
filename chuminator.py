import datetime
import PyQt5.QtCore as qtco
import PyQt5.QtChart as qtch
import PyQt5.QtWidgets as qtwi
import PyQt5.QtGui as qtgu
import sys
import yfinance as yf


def get_chart(symbol, interval, start, end):
    ticker = yf.Ticker(symbol)
    data_reader = ticker.history(interval=interval, start=start, end=end)
    cstick_series = qtch.QCandlestickSeries()
    cstick_series.setName(interval)
    cstick_series.setIncreasingColor(qtgu.QColorConstants.Green)
    cstick_series.setDecreasingColor(qtgu.QColorConstants.Red)
    dates = []
    for (ts, (opn, hgh, low, cls, vol, div, splits)) in data_reader.iterrows():
        ts_qdt = qtco.QDateTime(ts)
        ts_str = ts_qdt.toString(qtco.Qt.ISODate)
        ts_flt = ts_qdt.toMSecsSinceEpoch()
        candlestickset = qtch.QCandlestickSet(ts_flt)
        candlestickset.setOpen(opn)
        candlestickset.setHigh(hgh)
        candlestickset.setLow(low)
        candlestickset.setClose(cls)
        cstick_series.append(candlestickset)
        dates.append(ts_str)
    chart = qtch.QChart()
    chart.setTheme(qtch.QChart.ChartThemeDark)
    chart.addSeries(cstick_series)
    chart.setTitle(str(symbol) + " " + str(start) + " " + str(end))
    chart.createDefaultAxes()
    axis_x = chart.axes(qtco.Qt.Horizontal)[0]
    axis_x.setCategories(dates)
    axis_y = chart.axes(qtco.Qt.Vertical)[0]
    axis_y.setMin(axis_y.min() * 0.99)
    axis_y.setMax(axis_y.max() * 1.01)
    chart.legend().setVisible(True)
    chart.legend().setAlignment(qtco.Qt.AlignBottom)
    chart_view = qtch.QChartView(chart)
    chart_view.setRenderHint(qtgu.QPainter.Antialiasing)
    return chart_view


def go():
    a = qtwi.QApplication(sys.argv)
    wind = qtwi.QMainWindow()
    grid = qtwi.QGridLayout()
    widg = qtwi.QWidget()
    widg.setLayout(grid)
    wind.setCentralWidget(widg)
    symbols = ['btc-usd', 'eth-usd', 'bnb-usd',
               'usdt-usd', 'sol-usd', 'usdc-usd',
               'ada-usd', 'xrp-usd', 'luna1-usd']
    positions = [(i, j) for i in range(3) for j in range(3)]
    for position, symbol in zip(positions, symbols):
        if symbol == '':
            continue
        interval = "1h"
        end = datetime.datetime.now()
        start = end - datetime.timedelta(days=2)
        grid.addWidget(get_chart(symbol, interval, start, end), *position)
    wind.show()
    while True:
        if a.hasPendingEvents():
            a.processEvents()
        qtco.QThread.msleep(20)


go()

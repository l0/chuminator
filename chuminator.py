import PyQt5.QtCore as qtco
import PyQt5.QtChart as qtch
import PyQt5.QtWidgets as qtwi
import PyQt5.QtGui as qtgu
import sys
import yfinance as yf


def yf_get_history(symbol):
    ticker = yf.Ticker(symbol)
    return ticker.history(period="30d")


def get_chart(symbol):
    data_reader = yf_get_history(symbol)
    cstick_series = qtch.QCandlestickSeries()
    cstick_series.setName("days")
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
    chart.setTitle(symbol)
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
        grid.addWidget(get_chart(symbol), *position)
    wind.show()
    while True:
        if a.hasPendingEvents():
            a.processEvents()
        qtco.QThread.msleep(20)


go()

# import binance as bnc
# import coinbase as cnb
# import jax.numpy
# import jax.numpy as jnp
# import krakenex as krk
# import PyQt5.Qt3DCore as qttd
import PyQt5.QtChart as qtch
import PyQt5.QtCore as qtco
# import PyQt5.QtDataVisualization as qtdv
import PyQt5.QtGui as qtgu
import PyQt5.QtWidgets as qtwi
# import qdarkstyle as qds
# import sqlalchemy as sa
# import zmq as zmq
import yfinance as yf


def yf_get_history(symbol):
    ticker = yf.Ticker(symbol)
    return ticker.history(period="30d")


def get_chart(symbol, data_reader):
    cstick_series = qtch.QCandlestickSeries()
    cstick_series.setName(symbol)
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
    symbol = "btc-usd"
    hist_df = yf_get_history(symbol)
    chart_view = get_chart(symbol, hist_df)
    window = qtwi.QMainWindow()
    window.setCentralWidget(chart_view)
    window.show()
    while True:
        if a.hasPendingEvents():
            a.processEvents()
        qtco.QThread.msleep(20)


go()

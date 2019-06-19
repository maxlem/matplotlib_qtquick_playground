
from .backend_qquick5agg import MatplotlibIconProvider, FigureCanvasQTAgg, FigureCanvasQTAggToolbar

import os
QMLDIR = os.path.dirname(__file__)

from PyQt5.QtQml import qmlRegisterType

qmlRegisterType(FigureCanvasQTAggToolbar, "Backend", 1, 0, "FigureToolbar")
qmlRegisterType(FigureCanvasQTAgg, "Backend", 1, 0, "Figure" )
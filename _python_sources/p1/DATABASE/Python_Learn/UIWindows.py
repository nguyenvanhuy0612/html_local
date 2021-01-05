from pywinauto import application
import pywinauto
import math
app = application.Application()
app.start("notepad.exe")
# dlg = app["Untitled - Notepad"]
dlg = app.top_window()

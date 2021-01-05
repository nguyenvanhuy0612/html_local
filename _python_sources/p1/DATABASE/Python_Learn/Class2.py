class huy1(object):
    # Thuoc tinh
    globals_var = 'globals_var111'

    # Phuong thuc
    def __init__(self):
        print("Ham khoi tao cua class ")
        self.globals_var = "Abc"

    def info(self, name="huy1"):
        print(dir(huy1))
        print("info " + name)
        print(self.globals_var)


h1 = huy1()
h1.info()
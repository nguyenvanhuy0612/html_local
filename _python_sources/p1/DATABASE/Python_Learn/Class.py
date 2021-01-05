class huy1:
    #Thuoc tinh
    globals_var = 'globals_var111'

    # Phuong thuc
    def __init__(self):
        print("Ham khoi tao cua class ")

    def info(self, name="huy1"):
        print(dir(huy1))
        print("info " + name)
        print(self.globals_var)


h1 = huy1()
h1.info("kkk")
h1.name = 'Tototo'
print(h1.globals_var, h1.name)
# Getting the class name of an object
print(h1.__class__.__name__)
print(type(h1))

print("+" * 50)


# Khac nhau giua self va khong co self

class A():
    def wazzup(self):
        print("Wazzupppp!", "self")

    def wazzup1(dat):
        print("Wazzupppp!", "dat")

    def wazzup2(dnh):
        print("Wazzupppp!", "dnh")

    def wazzup3(g):
        print("Wazzupppp!", "random string")


print("-" * 20)
a1 = A()
a1.wazzup()
a1.wazzup1()
a1.wazzup2()
a1.wazzup3()

print(":" * 50)


# __init__

class testInit:
    def __init__(self, p_name, p_age, p_level):
        self.name = p_name
        self.age = p_age
        self.level = p_level


ob = testInit("object", 16, 200)  # self là ob, "object" là p_name, 16 là p_age còn 200 là p_level

# Khi khởi tại object ob thì:
"""
def __init__(self, p_name, p_age, p_level):
    self.name  = p_name
    self.age   = p_age
    self.level = p_level 
# Sẽ được biến hóa thành

def __init__(ob, "object", 16, 200):
    ob.name  = "object"
    ob.age   = 16
    ob.level = 200 
"""

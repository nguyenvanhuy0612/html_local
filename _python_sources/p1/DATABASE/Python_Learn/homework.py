class Fruit(object):
    def __init__(self):
        print("Parent: init")

    def nutrition(self):
        print("Parent: nutrition")

    def fruit_shape(self):
        print("Parent: fruit_shape")


class apple(Fruit):
    def __init__(self):
        super(apple, self).__init__()
        # Fruit.__init__(self)
        print("apple: init")

    def nutrition(self):
        print("apple: nutrition")

    def color(self):
        print("apple: color")


fr1 = Fruit()
fr1.nutrition()

print("/\\" * 20)
ap1 = apple()
ap1.nutrition()
ap1.fruit_shape()

print("~" * 50)


# Bai 2 Exception Handling Exercise

def exceptionHandle(color):
    print("Create car dictionary")
    car = {"make": 'Honda Chine', "model": 'Dream Guangzhou', "year": '2010'}
    try:
        print("Execute result: \"%s\"" % car[color])
    except  KeyError:
        print("Can't access to " + color)
    else:
        print("This is execute with key \"%s\" in the car" % color)
    finally:
        print("Executed complete")


exceptionHandle("year")

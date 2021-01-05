class Car(object):
    _base = 100

    def __init__(self, make, model):
        self.make = make
        self.model = model

    def info(self):
        print(self._base)

    def sum(self):
        self._base += self._base

    def ab(self):
        self.sum()
        print(self._base)


c3 = Car("a", "b")
c3.ab()

# c1 = Car("bmw", "550i")
# print(c1.make)
# print(c1.model)
# print(c1.info())
#
# c2 = Car('benz', 'E350')
# print(c2.make)
# print(c2.model)

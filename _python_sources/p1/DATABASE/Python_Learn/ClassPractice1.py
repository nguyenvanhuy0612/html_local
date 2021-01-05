class cars(object):
    wheels = 4

    def __init__(self, make, model="550"):
        print("The Car instance")
        self.car_make = make
        self.car_model = model

    def info(self):
        print("Make of the car: " + self.car_make)
        print("Model of the car: " + self.car_model)

    def car111(self, message="ABC"):
        print("car111", message)


print("object cars.wheels: ", cars.wheels)
c1 = cars("honda", "2017")
c1.wheels = 2
print("c1.wheels: ", c1.wheels)
print(c1.car_make)
print(c1.car_model)
c1.info()

# object cars.wheels
print("object cars.wheels: " + str(cars.wheels))
# c2 = cars("benz")
# print(c2.car_make)


print("=" * 50)


# Kế thừa Inheritance

class BMW(cars):
    def __init__(self, make):
        self.make = make + " self"
        super().__init__(make, model="2020")
        print("The BMW instance")

    def infoBMW(self, *args):
        print("self.make: ", self.make)
        for i in args:
            cars.car111(self, i)


b1 = BMW(make="toyota")
b1.info()
b1.infoBMW(123, 111, "huy", 'kkkk')

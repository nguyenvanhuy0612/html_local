class cars(object):
    model = '5555'

    def __init__(self):
        print("Cars instance")

    def info(self):
        print("Cars info")

    def stop(self):
        print("Cars Stop")

    def start(self):
        print("Cars start")


class BMW(cars):
    reason = 'a'

    def __init__(self):
        cars.__init__(self)
        super(BMW, self).__init__()
        print("BMW instance")

    def info(self):
        super().info()
        print("BMW info")

    def stop(self):
        print(self.reason)
        print("BMW stop: ")
        print("super().model: ", super().model)

    reason += reason


# Python k co overloading

bwm1 = BMW()
bwm1.info()
bwm1.stop()

# lớp con luôn chạy contructors của lớp cha trước
# nến lớp con k có contructors thì chỉ chạy contructors của lớp cha
# (__init__() của lớp cha luôn được chạy
print("=" * 50)


class suzuki(cars):
    def info(self):
        print("Suzuki info")

    def motobike(self, name):
        super(suzuki, self).start()
        print("Suzuki motobike name: ", name)


s1 = suzuki()
s1.motobike("Z1000")
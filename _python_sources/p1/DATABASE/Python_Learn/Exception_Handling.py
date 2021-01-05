def exception_handling1():
    try:
        a = 10
        b = 'aaaa'
        c = 0
        d = (a + b) / c
        print(d)
    except:
        print("In the except block, this is impossible")


def exception_handling2():
    try:
        a = 10
        b = 10
        c = 4
        d = (a + b) / c
        print(d)
    except ZeroDivisionError:
        print("Zero Division")
    except TypeError:
        print("Can't add sring to integer")
    except:
        print("In the except block")


exception_handling1()
exception_handling2()

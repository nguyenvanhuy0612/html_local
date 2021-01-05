def exception_handling():
    try:
        a = 10
        b = 10
        c = 0
        d = (a + b) / c
        print(d)
    except:
        print("In the except block")
        #     View exception in console
        raise Exception("This is an exception")
    else:
        print("Because there was no exception, else is executed")
    finally:
        print("Finally, always executed")


exception_handling()

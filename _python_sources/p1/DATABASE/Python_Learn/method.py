def sum_nums(num1=0, num2=0):
    print("Summary of %f and %f is %f" % (num1, num2, num1 + num2))
    return num1 + num2


sum1 = sum_nums(-1, 3)
sum2 = sum_nums(4, 5)
sum3 = sum_nums()
sum4 = sum_nums(num2=4, num1=1)
print(sum1, type(sum1))
print(sum2, type(sum2))
print(sum3, type(sum3))
print(sum4, type(sum4))


def isMetro(city):
    cities = ["hn", "hcm", "dn"]
    if city in cities:
        return True
    else:
        return False


c1 = isMetro("hn")
c2 = isMetro("qn")
print(c1, type(c1))
print(c2, type(c2))

"""
Variables scope
"""
print("=" * 50)
a = 10


def var_scope(a):
    print("Variable a ", a)
    a = 2
    print("Variable a ", a)

var_scope(4)
print("a ", a)
#############
print("=" * 50)
a = 10


def var_scope(a1):
    global a
    print("Variable a: ", a)
    print("Variable a1: ", a1)
    a = 2
    print("Variable a: ", a)


var_scope(4)
print("global a: ", a)

"""
Built-in function
"""
#############
print("=" * 50)


def largest_num(*args):
    print(max(args))
    return max(args)


print(largest_num(3, 4, 5, 6, 8, 2, 1, 4, 5))


def smallest_num(*args):
    print(min(args))
    return min(args)


print(smallest_num(1, 2, 3, -5, 100, -5))

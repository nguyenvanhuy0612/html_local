'''
Keyword
import keyword
print(keyword.kwlist)

a = b = c = 10
print(a)
print(b)
print(c)
print("=================")
a, b, c = 10, 20, 30
print(a)
print(b)
print(c)
print("=================")
'''

'''
Numbers

'''
# int_num = 10
# float_num = 20.0
# print(int_num, type(int_num))
# print(float_num, type(float_num))


'''
String voi Python
'''
strA = "abc"
strB = "123"

strC = "1_" + strA[0].upper() + strA[1:] + "_" + strB
print(strC)
print("1_%s%s_%s" % (strA[0].upper(), strA[1:], strB))
print("=" * 50)

'''
List python
'''
cars = ["bmw", "audi", "toyota"]
empty_list = []
print(empty_list)
print(cars)
print(cars[0])

num_list = [1, 2, 3]
sum_num = num_list[0] + num_list[1] + num_list[2]
print(num_list)
print(sum_num)

more_cars = ["bmw", "audi", "toyota"]
more_cars[1] = "mec"
print(more_cars)

print("=" * 50)

length_cars = len(more_cars)
print(length_cars)

more_cars.append("Benz")
print(more_cars)

more_cars.insert(1, "jeep")
print(more_cars)

more_cars.append("honda")
more_cars.append("honda")
print(more_cars)
honda_index = more_cars.index("honda")
print(honda_index)
more_cars[5] = "suzuki"

last_car = more_cars.pop()
print(last_car)
print(more_cars)

more_cars.remove("mec")
print(more_cars)

slicing = more_cars[2:4]
a = more_cars[2:]
b = more_cars[:3]
print(slicing)
print(a)
print(b)
print(more_cars)
print("sort", more_cars.sort())
print(more_cars)
c = [100, 5, 8, 45, 0, -1, -33]
c.sort()
print(c)
print("=" * 50)
"""
Dictionary
"""
dic_str = {"name": "huy", "age": 17, "local": "HCM"}
print(dic_str)
age = dic_str["age"]
print(age)
print(dic_str["local"])

dic_person = {"huy": {"name": "huy", "age": 17, "local": "hcm"}, "hoang": {"name": "hoang", "age": 22, "local": "hn"}}
print(dic_person["hoang"])
print(dic_person["hoang"]["age"])
print(dic_str.keys())
print(dic_str.values())
print(dic_person.values())
print(dic_str.items())
print("=" * 50)

"""
Tuple
"""
tup_person = ["huy", "man", 24]
tup_person.append(44)
print(tup_person)

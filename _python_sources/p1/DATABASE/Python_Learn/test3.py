"""
if else
"""
a = True
if a:
    print("True")
else:
    print("False")
print("End")

color = "red"
if color == "red":
    print("Red color: ", color)
elif color == "blue":
    print("Blue color: ", color)
else:
    print("color: ", color)
print("Alway print")
print("=" * 50)

x = 0
while x < 10:
    if x == 0:
        print("%d value" % x)
    print("%d values" % x)
    x = x + 2

y = 0
lst = []
while y < 10:
    if y == 8:
        break
    if y == 3:
        print(3)
        y += 1
        continue
    lst.append(y)
    y += 1

print(lst)

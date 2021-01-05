l1 = [1, 2, 3, 4]
l2 = [5, 6, 7, 8, 9, 10]

for a, b in zip(l1, l2):
    print(a, " - ", b)

l3 = list(range(0, 10))
print(l3)
for i in range(0, 10):
    print(i, end="-")

print("")
l4 = range(10)
print(l4, type(l4))
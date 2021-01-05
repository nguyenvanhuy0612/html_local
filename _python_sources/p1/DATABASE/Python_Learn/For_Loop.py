strA = "This is sample test"
for i in strA:
    print(i, "-", end="")
print("")
print("Hello", "how are you?", sep="---")

cars = ["bmw", "audi", "toyota"]
for i in cars:
    print(i)

print("=" * 50)
dic_str = {"name": "huy", "age": 17, "local": "HCM"}
for i in dic_str:
    print(i, type(i))
    print(dic_str[i])

print("-" * 50)
listID = ['6500300', '6500301', '6500302', '6500303', '6500304', '6500305', '6500306', '6500307', '6500308']
for i in listID:
    print(i)
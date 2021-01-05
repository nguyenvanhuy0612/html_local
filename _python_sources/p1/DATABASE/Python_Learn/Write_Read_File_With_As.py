"""
With / As Keywords

File IO
'w' -> Write-Only mode
'r' -> Read-Only mode
'r+' -> Read and Write mode
'a' -> Append mode
"""

print("Normal Write start")
my_write = open("firstfile.txt", "w")
my_write.write("Trying to write to the file")
my_write.close()

print("Normal Read start")
my_read = open("firstfile.txt", "r")
print(str(my_read.read()))

# Mo file va ghi hoac doc trong ham
print("=" * 50)
print("With As Write start")
with open("withas.txt", 'w') as with_as_write:
    with_as_write.write("This is an example of with as read/write")
print()
print("With As Read start")
with open("withas.txt", 'r') as with_as_read:
    print(str(with_as_read.read()))

for i in range(10):
    my_write = open("firstfile.txt", "a")
    my_write.write("Trying to write to the file\n")
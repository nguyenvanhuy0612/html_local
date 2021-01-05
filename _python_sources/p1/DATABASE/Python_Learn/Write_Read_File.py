"""
File IO
'w' -> Write-Only mode
'r' -> Read-Only mode
'r+' -> Read and Write mode
'a' -> Append mode
"""
# Write
my_list = range(1, 10)
my_file = open("firstfile_write.txt", 'w')
for item in my_list:
    my_file.write(str(item) + "\n")

my_file.close()

# Read
"""
Read a file .read()
Read line by line .readline()
"""
my_read_file = open("firstfile_read.txt", 'r')
print(str(my_read_file.read()))
my_read_file.close()

print("/" * 10, "Line by line", "\\" * 10)
my_read_line = open("firstfile_read.txt", 'r')
print(str(my_read_line.readline()))
print(str(my_read_line.readline()))
print(str(my_read_line.readline()))
my_read_line.close()
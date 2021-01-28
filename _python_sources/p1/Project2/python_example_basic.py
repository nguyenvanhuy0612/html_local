# Đảo ngược chuỗi sử dụng slicing

my_string = "ABCDE"
reversed_string = my_string[::-1]

print(reversed_string)

# Kết quả
# EDCBA


# ===================================================================================================
# Viết Hoa ký tự đầu tiên của mỗi từ
# Điều này được thực hiện bằng cách sử dụng phương thức title() của string class.
my_string = "đây là một chuỗi"

# Sử dụng hàm title() của lớp string
new_string = my_string.title()

print(new_string)

# kết quả
# Đây Là Một Chuỗi

# ===================================================================================================
# Tìm các phần tử duy nhất trong một chuỗi
# Chúng ta sử dụng tính chất của kiểu dữ liệu set: Tất cả các phần tử trong set là duy nhất.
my_string = "aavvccccddddeee"

# Chuyển chuỗi thành một set
temp_set = set(my_string)

# Chuyển set thành một chuỗi sử dụng join
new_string = ''.join(temp_set)

print(new_string)

# Kết quả
# acdve

# Vì set không có thứ tự
# nên thứ tự chuỗi mới nhận được là ngẫu nhiên


# ===================================================================================================
# In một Chuỗi hoặc một List n lần
# Bạn có thể sử dụng phép nhân (*) với chuỗi hoặc List. Điều này cho phép chúng ta nhân chúng bao nhiêu lần tùy thích.
n = 3  # Số lần lặp lại

my_string = "abcd"
my_list = [1, 2, 3]

print(my_string * n)
# abcdabcdabcd

# Một trường hợp sử dụng thú vị của điều này có thể là để xác định một list với các giá trị không đổi – hãy thử xem:

n = 4
my_list = [0] * n  # n Độ dài của list
# [0, 0, 0, 0]

print(my_list * n)
# [1,2,3,1,2,3,1,2,3]

# ===================================================================================================
# List comprehension
# Đoạn code sau tạo một list mới bằng cách nhân từng phần tử của list cũ với 2.
# Nhân mỗi phần tử của list với 2

original_list = [1, 2, 3, 4]

new_list = [2 * x for x in original_list]

print(new_list)
# [2,4,6,8]

# ===================================================================================================
# Hoán đổi giá trị giữa hai biến trong Python
# Python làm cho việc hoán đổi giá trị giữa 2 biến khá đơn giản mà không cần sử dụng một biến trung gian khác.
a = 1
b = 2

a, b = b, a

print(a)  # 2
print(b)  # 1

# ===================================================================================================
# Tách một chuỗi thành một list

# Chúng ta có thể tách một chuỗi thành một list chứa các chuỗi con bằng phương thức .split().
#
# Bạn cũng có thể truyền một đối số (dấu phân cách) để hướng dẫn tách chuỗi theo chỉ định của bạn.

string_1 = "Tên tôi là NIIT Hà Nội"
string_2 = "chuỗi 1/ chuỗi 2"

# Tách chuỗi mặc định sẽ tách từ khoảng trắng ' '
print(string_1.split())
# ['Tên', 'tôi', 'là', 'NIIT', 'Hà', 'Nội']

# Tách chuỗi từ ký tự '/'
print(string_2.split('/'))
# ['chuỗi 1', ' chuỗi 2']

# ===================================================================================================
# Kết hợp một danh sách các chuỗi thành một chuỗi
# Chúng ta sẽ sử dụng phương thức join().
#
# Trong trường hợp này, chúng ta truyền đối số (dấu phân tách) để hướng dẫn ghép chuỗi. (Mình sẽ sử dụng dấu phảy)

list_of_strings = ['Tên', 'tôi', 'là', 'NIIT', 'Hà', 'Nội']

# Sử dụng join và phân tách bằng dấu phảy
print(','.join(list_of_strings))

# Output
# Tên,tôi,là,NIIT,Hà,Nội

# ===================================================================================================
# Kiểm tra một chuỗi có phải chuỗi đối xứng

my_string = "abcba"

if my_string == my_string[::-1]:
    print("Chuỗi đối xứng")
else:
    print("Chuỗi không đối xứng")

# Kết quả
# Chuỗi đối xứng

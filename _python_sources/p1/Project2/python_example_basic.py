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

# ===================================================================================================
# Tình số lần xuất hiện của các phần tử trong một List
# Có nhiều cách để làm điều này, nhưng mình thích sử dụng Counter của Python.
#
# Bộ đếm Python theo dõi tần suất của từng phần tử trong container.
#
# Counter() trả về một dictionary với các phần tử là key và số lần xuất hiện là value.
#
# Chúng tôi cũng sử dụng hàm most_common() để lấy phần tử most_frequent (xuất hiện nhiều nhất) trong List.

# Tìm số lần xuất hiện của mỗi phần từ trong List

# import Counter
from collections import Counter

my_list = ['a', 'a', 'b', 'b', 'b', 'c', 'd', 'd', 'd', 'd', 'd']
count = Counter(my_list)  # Xác định đối tượng counter

print(count)  # In thông tin tất cả
# Counter({'d': 5, 'b': 3, 'a': 2, 'c': 1})

print(count['b'])  # Số lần xuất hiện của phần tử cụ thể
# 3

print(count.most_common(1))  # Phần tử xuất hiện nhiều nhất
# [('d', 5)]

# ===================================================================================================
# Tìm xem hai chuỗi có đảo chữ không

# Một ứng dụng thú vị của Counter là tìm chuỗi đảo chữ.
#
# Đảo chữ là một từ hoặc cụm từ được hình thành bằng cách sắp xếp lại các chữ cái của một từ hoặc cụm từ khác nhau.
#
# Nếu các đối tượng Counter của hai chuỗi bằng nhau, thì chúng là đảo chữ cái.

# import Counter
from collections import Counter

str_1, str_2, str_3 = "acbde", "abced", "abcda"
cnt_1, cnt_2, cnt_3 = Counter(str_1), Counter(str_2), Counter(str_3)

if cnt_1 == cnt_2:
    print('1 và 2 Đảo chữ')
if cnt_1 == cnt_3:
    print('1 và 3 Đảo chữ')

# ===================================================================================================
# Sử dụng Khối try-except-else
# Xử lý lỗi trong Python có thể được thực hiện dễ dàng bằng cách sử dụng khối try / except.
#
# Thêm một câu lệnh else vào khối này rất hữu ích. Nó sẽ chạy khi không có ngoại lệ xảy ra trong khối try.
#
# Nếu bạn cần chạy một cái gì đó không phân biệt ngoại lệ, hãy sử dụng finaly.

a, b = 1, 0

try:
    print(a / b)
    # Ngoại lệ xảy ra khi b == 0
except ZeroDivisionError:
    print("Chia cho số 0")
else:
    print("Không có ngoại lệ xảy ra")
finally:
    print("Luôn luôn chạy lệnh này!")

# ===================================================================================================
# Sử dụng liệt kê (Enumerate) để nhận các cặp index / value
# Kịch bản sau đây sử dụng phép liệt kê (enumerate) để lặp qua các giá trị trong list cùng với các chỉ mục (index) của chúng.

my_list = ['a', 'b', 'c', 'd', 'e']

for index, value in enumerate(my_list):
    print('{0}: {1}'.format(index, value))

# 0: a
# 1: b
# 2: c
# 3: d
# 4: e

# ===================================================================================================
# Kiểm tra mức sử dụng bộ nhớ của một đối tượng
# Đoạn code sau đây có thể được sử dụng để kiểm tra mức sử dụng bộ nhớ của một đối tượng.
import sys

num = 21

print(sys.getsizeof(num))

# Kết quả trong Python 2 là: 24
# Kết quả trong Python 3 là: 28

# ===================================================================================================
# Hợp nhất hai từ điển
# Trong khi ở Python 2, chúng ta đã sử dụng phương thức update() để hợp nhất hai Dictionaries.
#
# Nhưng Python 3.5 làm cho quá trình này đơn giản hơn nhiều.
#
# Trong đoạn code được đưa ra dưới đây, hai Dictionaries được hợp nhất.
#
# Lưu ý: Các value của Dictionaries thứ hai sẽ được sử dụng nếu key bị trùng với key trong Dictionaries thứ nhất.
dict_1 = {'apple': 9, 'banana': 6}
dict_2 = {'banana': 4, 'orange': 8}

combined_dict = {**dict_1, **dict_2}

print(combined_dict)


# Output
# {'apple': 9, 'banana': 4, 'orange': 8}

# Nếu bạn muốn giữ các giá trị của chúng, bạn có thể làm như sau:

def mergeDict(dict1, dict2):
    ''' Hợp nhất dictionaries và giữ giá trị của key phổ biến trong list'''
    dict3 = {**dict1, **dict2}
    for key, value in dict3.items():
        if key in dict1 and key in dict2:
            dict3[key] = [value, dict1[key]]

    return dict3


# Hợp nhất dictionaries và thêm giá trị của key phổ biến trong list
dict3 = mergeDict(dict1, dict2)

print('Dictionary 3 :')
print(dict3)

# ===================================================================================================
# Tính thời gian thực hiện để thực thi một đoạn code trong Python
# Đoạn code sau sử dụng thư viện time để dễ dàng giúp chúng ta tính thời gian thực để thực thi một đoạn code trong Python.

# import thư viện time
import time

# Kiểm tra thời gian bắt đầu
start_time = time.time()

# Code cần kiểm tra
a, b = 1,2
c = a+ b

# Kiểm tra thời gian kết thúc
end_time = time.time()

# Tính thời gian chênh lệch
time_taken_in_micro = (end_time- start_time)*(10**6)

# In kết quả
print(" Thời gian thực thi micro_seconds: {0} ms").format(time_taken_in_micro)
# ===================================================================================================
# ===================================================================================================

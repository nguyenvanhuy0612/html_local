class BySubjectGradeBook(object):
    def __init__(self):
        self._grades = {}

    def add_student(self, name):
        self._grades[name] = {}

    def report_grade(self, name, subject, grade):
        by_subject = self._grades[name]
        grade_list = by_subject.setdefault(subject, [])
        grade_list.append(grade)
        return self._grades[name]


book = BySubjectGradeBook()
book.add_student('bondaica')
book.report_grade('bondaica', 'math', 75)
book.report_grade('bondaica', 'physics', 80)

# Một kiến thức cơ bản mà bạn chưa biết đó là
lst = [1, 2, 3]
another_lst = lst
another_lst[0] = 0
print(lst)
# [0, 2, 3]
print(another_lst)
# [0, 2, 3]

dic = {}
another_dict = dic
another_dict['item'] = 'first item'
print(dic)
# {'item': 'first item'}
print(another_dict)
# {'item': 'first item'}

# Edit: để có thể tránh được tình huống này
lst = [1, 2, 3]
another_lst = lst[:]  # same as list(lst)
another_lst[0] = 0
print(lst)
# [1, 2, 3]
print(another_lst)
# [0, 2, 3]

dic = {}
another_dict = dic.copy()  # same as dict(dic)
another_dict['item'] = 'first item'
print(dic)
# {}
print(another_dict)
# {'item': 'first item'}

# Bạn lưu ý một chỗ này cho mình, nó chỉ copy những cái con thôi nhé.
# Nếu nó là con của con thì nó sẽ không được như mong muốn đâu
lst = [[1, 2, 3], [4, 5, 6]]
another_lst = lst[:]
another_lst[0][0] = 10
print(lst)
# [[10, 2, 3], [4, 5, 6]]
print(another_lst)
# [[10, 2, 3], [4, 5, 6]]

# Mình gợi ý cách sau đây
lst = [[1, 2, 3], [4, 5, 6]]
another_lst = [x[:] for x in lst]
another_lst[0][0] = 10
print(lst)
# [[1, 2, 3], [4, 5, 6]]
print(another_lst)
# [[10, 2, 3], [4, 5, 6]]

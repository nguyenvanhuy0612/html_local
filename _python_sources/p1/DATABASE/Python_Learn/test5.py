s = "This is string"
s.upper()


class Student:
    def __init__(self, name, age, math, literature, english):
        self.name = name
        self.age = age
        self.math = math
        self.literature = literature
        self.english = english

    def getName(self):
        return self.name

    def getAge(self):
        return self.age

    def getMath(self):
        return self.math

    def getLiterature(self):
        return self.literature

    def getEnglish(self):
        return self.english

    def getAverage(self):
        return (self.math + self.literature + self.english) / 3



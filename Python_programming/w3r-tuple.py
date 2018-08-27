"""
Write a Python program to get a list, sorted in increasing order by the last element in each tuple from a given list of non-empty tuples.
"""
def last(n): return n[-1]  
  
def sort_list_last(tuples):  
  return sorted(tuples, key=last)  
  
print(sort_list_last([(2, 5), (1, 2), (4, 4), (2, 3), (2, 1)])) 

print(sorted([5, 2, 3, 1, 4]))
print (sorted({1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'}))
print(sorted("This is a test string from Andrew".split(), key=str.lower))

student_tuples = [
        ('john', 'A', 15),
        ('jane', 'B', 12),
        ('dave', 'B', 10)
	]

print(sorted(student_tuples, key=lambda student: student[2]))   # sort by age

class Student:
        def __init__(self, name, grade, age):
                self.name = name
                self.grade = grade
                self.age = age
        def __repr__(self):
                return repr((self.name, self.grade, self.age))
        def weighted_grade(self):
                return 'CBA'.index(self.grade) / float(self.age)

student_objects = [
        Student('john', 'A', 15),
        Student('jane', 'B', 12),
        Student('dave', 'B', 10)
	]

print(sorted(student_objects, key=lambda student: student.age))   # sort by age
print('====================================')
print(sorted(student_objects, key=lambda student: student.age, reverse = True))   # sort by age
print(sorted(student_objects, key=lambda student: student.age, reverse = False))   # sort by age
print('====================================')
for i in range(3):
	print(student_objects[i].weighted_grade())
print(sorted(student_objects, key=lambda student: student.weighted_grade()))   # sort by age

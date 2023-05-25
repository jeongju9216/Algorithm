a = int(input())
b = int(input())
c = int(input())

sum = list(str(a * b * c))

for i in range(10):
  print(sum.count(str(i)))

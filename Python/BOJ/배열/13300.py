import math

n, k = map(int, input().split())
arr = [[0, 0] for _ in range(7)]

for _ in range(n):
  inputArr = list(map(int, input().split()))
  arr[inputArr[1]][inputArr[0]] += 1

result = 0
for classes in arr:
  woman = classes[0]
  man = classes[1]
  result += math.ceil(woman / k)
  result += math.ceil(man / k)

print(result)

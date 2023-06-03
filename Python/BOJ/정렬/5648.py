import sys; readl = sys.stdin.readline

n, *arr = readl().split()
while len(arr) < int(n):
  tmp = readl().split()
  arr.extend(tmp)

result = [int(item[::-1]) for item in arr]
result.sort()
print(*result, sep= "\n")

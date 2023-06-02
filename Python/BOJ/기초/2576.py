import sys

sum = 0
minResult = 1e9
for _ in range(7):
  num = int(sys.stdin.readline().rstrip())
  if num % 2 == 1:
    minResult = min(minResult, num)
    sum += num

if sum > 0:
  print(sum)
  print(minResult)
else:
  print(-1)

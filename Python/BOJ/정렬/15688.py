# PyPy3으로 제출해야 함
import sys; readl = sys.stdin.readline

n = int(readl())
exists = [0 for _ in range(2000001)]
maxNum = 0
for _ in range(n):
  num = int(readl())
  exists[1000000 + num] += 1
  maxNum = max(maxNum, 1000000 + num)
    
for i in range(maxNum + 1):
  for _ in range(exists[i]):
    print(i -1000000)

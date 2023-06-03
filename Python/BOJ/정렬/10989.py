import sys; readl = sys.stdin.readline

n = int(readl())
exists = [0 for _ in range(10001)]
for _ in range(n):
  num = int(readl())
  exists[num] += 1

for i in range(10001):
  for _ in range(exists[i]):
    print(i)

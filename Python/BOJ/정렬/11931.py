import sys; readl = sys.stdin.readline

n = int(readl())
exists = [False for _ in range(2000001)]
for _ in range(n):
  num = int(readl())
  exists[1000000 + num] = True
    

for i in reversed(range(2000001)):
  if exists[i]:
    print(i -1000000)

import sys; readl = sys.stdin.readline

n = int(readl())
arr = []
for _ in range(n):
  coord = list(map(int, readl().split()))
  arr.append(coord)

arr.sort()

for coord in arr:
  print(coord[0], coord[1])

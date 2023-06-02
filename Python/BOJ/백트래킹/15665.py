import sys
readl = sys.stdin.readline

def solution(index):
  if len(tmp) == m:
    result.add(tuple(tmp))
    return

  for i in range(n):
    tmp.append(arr[i])
    solution(index + 1)
    tmp.pop()

n, m = map(int, readl().split())
arr = sorted(list(map(int, readl().split())))
tmp = []

result = set()
solution(0)

for item in sorted(result):
  print(*item)

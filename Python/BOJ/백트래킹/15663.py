import sys
readl = sys.stdin.readline

def solution(index):
  if len(tmp) == m:
    result.add(tuple(tmp))
    return

  for i in range(n):
    if not visited[i]:
      tmp.append(arr[i])
      visited[i] = True
      solution(index + 1)
      visited[i] = False
      tmp.pop()

n, m = map(int, readl().split())
arr = sorted(list(map(int, readl().split())))
tmp = []
visited = [False for _ in range(n)]

result = set()
solution(0)

for item in sorted(result):
  print(*item)

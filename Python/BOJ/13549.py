import sys
readl = sys.stdin.readline
from collections import deque

n, k = map(int, readl().split())
visited = [1e9 for _ in range(1000000)]

q = deque([(k, 0)])
visited[k] = 0

result = 1e9
while q:
  num, count = q.popleft()

  if num == n:
    result = count
    break

  half = int(num / 2)
  if num % 2 == 0 and visited[half] > count:
    visited[half] = count
    q.insert(0, (half, count))
  
  if num - 1 >= 0 and visited[num - 1] > count + 1:
    visited[num - 1] = count + 1
    q.append((num - 1, count + 1))

  if num + 1 < 1000000 and visited[num + 1] > count + 1:
    visited[num + 1] = count + 1
    q.append((num + 1, count + 1))

print(result)

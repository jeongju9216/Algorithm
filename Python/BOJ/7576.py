import sys
readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

m, n = map(int, readl().split())
map = [list(readl().split()) for _ in range(n)]

total = n * m

queue = []
index = 0
visited = [[False for _ in range(m)] for _ in range(n)]
for i in range(n):
  for j in range(m):
    if map[i][j] == "1":
      queue.append((i, j, 0))
      visited[i][j] = True
    elif map[i][j] == "-1":
      total -= 1

result = 0
while index < len(queue):
  node = queue[index]
  index += 1

  result = max(result, node[2])
  
  for i in range(4):
    nx = node[0] + dx[i]
    ny = node[1] + dy[i]
    nc = node[2] + 1

    if not (0 <= nx < n and 0 <= ny < m):
      continue
    if not (not visited[nx][ny] and map[nx][ny] == "0"):
      continue

    visited[nx][ny] = True
    queue.append((nx, ny, nc))

if total > index:
  print("-1")
else:
  print(result)
  

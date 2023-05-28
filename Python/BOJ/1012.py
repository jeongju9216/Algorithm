import sys
readl = sys.stdin.readline

def bfs(x, y):
  queue = [(x, y)]
  index = 0
  
  maps[x][y] = 0
  
  while index < len(queue):
    node = queue[index]
    index += 1

    for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
      nx = node[0] + dx
      ny = node[1] + dy

      if not (0 <= nx < n and 0 <= ny < m):
        continue
      if not maps[nx][ny] == 1:
        continue

      maps[nx][ny] = 0
      queue.append((nx, ny))

t = int(readl())
for _ in range(t):
  m, n, k = map(int, readl().split())
  maps = [[0 for _ in range(m)] for _ in range(n)]

  for _ in range(k):
    x, y = map(int, readl().split())
    maps[y][x] = 1

  result = 0
  for i in range(n):
    for j in range(m):
      if maps[i][j] == 1:
        result += 1
        bfs(i, j)
  
  print(result)

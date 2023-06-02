import sys
readl = sys.stdin.readline

m, n, h = map(int, readl().split())
board = [[list(map(int, readl().split())) for _ in range(n)] for _ in range(h)]

queue = []
index = 0
total = n * m * h

for i in range(h):
  for j in range(n):
    for k in range(m):
      if board[i][j][k] == 1:
        queue.append((i, j, k, 0))
      elif board[i][j][k] == -1:
        total -= 1
        
result = 0
while index < len(queue):
  node = queue[index]
  index += 1

  result = max(result, node[3])

  for dh, dx, dy in [(-1, 0, 0), (1, 0, 0), (0, -1, 0), (0, 1, 0), (0, 0, -1), (0, 0, 1)]:
    nh = node[0] + dh
    nx = node[1] + dx
    ny = node[2] + dy
    nc = node[3] + 1
    
    if not (0 <= nh < h and 0 <= nx < n and 0 <= ny < m):
      continue
      
    if board[nh][nx][ny] == 0:
      board[nh][nx][ny] = 1
      queue.append((nh, nx, ny, nc))

if total > index:
  print("-1")
else:
  print(result)

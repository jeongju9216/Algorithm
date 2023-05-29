import sys
readl = sys.stdin.readline
from collections import deque

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def numbering(start, id):
  q = deque([start])
  board[start[0]][start[1]] = id
  
  while q:
    x, y = q.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < n):
        continue

      if board[nx][ny] == 1:
        board[nx][ny] = id
        q.append((nx, ny))

def findBridge(start, id):
  q = deque([start])
  visited = [[False for _ in range(n)] for _ in range(n)]
  visited[start[0]][start[1]] = True
  
  while q:
    x, y, count = q.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]
      nc = count + 1

      if not (0 <= nx < n and 0 <= ny < n):
        continue

      # 다른 육지와 연결됨
      if board[nx][ny] != 0 and board[nx][ny] != id:
        return count

      # 바다를 건넘
      if board[nx][ny] == 0 and not visited[nx][ny]:
        visited[nx][ny] = True
        q.append((nx, ny, nc))
  return 1e9
  
n = int(readl())
board = [list(map(int, readl().split())) for _ in range(n)]

id = 2
for i in range(n):
  for j in range(n):
    if board[i][j] == 1:
      numbering((i, j), id)
      id += 1

result = 1e9
for i in range(n):
  for j in range(n):
    if board[i][j] > 0:
      result = min(result, findBridge((i, j, 0), board[i][j]))

print(result)

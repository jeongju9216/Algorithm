import sys
readl = sys.stdin.readline
from collections import deque

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def bfs(x, y):
  q = deque([(x, y)])
  visited[x][y] = True
    
  while q:
    x, y = q.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < m):
        continue
      if visited[nx][ny]:
        continue

      if board[nx][ny] > 0:
        visited[nx][ny] = True
        q.append((nx, ny))
      else:
        delList.append((x, y))

n, m = map(int, readl().split())
board = [list(map(int, readl().split())) for _ in range(n)]

count = 0
time = 0
while True:
  count = 0
  visited = [[False for _ in range(m)] for _ in range(n)]

  delList = []
  for i in range(n):
    for j in range(m):
      if not visited[i][j] and board[i][j] > 0:
        count += 1
        bfs(i, j)

  for delItem in delList:
    board[delItem[0]][delItem[1]] -= 1
  
  if count == 0:
    time = 0
    break
  elif count >= 2:
    break
  
  time += 1

print(time)

import sys
readl = sys.stdin.readline
from collections import deque

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

n, m = map(int, readl().split())
board = [list(map(int, readl().rstrip())) for _ in range(n)]

visited = [[[0 for _ in range(2)] for _ in range(m)] for _ in range(n)]

q = deque([(0, 0, 0)])
visited[0][0][0] = 1

result = 1e9
while q:
  x, y, c = q.popleft()

  if x == n-1 and y == m-1:
    result = visited[x][y][c]
    break
    
  for i in range(4):
    nx = x + dx[i]
    ny = y + dy[i]
    
    if not (0 <= nx < n and 0 <= ny < m):
      continue

    if board[nx][ny] == 0 and visited[nx][ny][c] == 0:
        visited[nx][ny][c] = visited[x][y][c] + 1
        q.append((nx, ny, c))
      
    if c == 0 and board[nx][ny] == 1:
      visited[nx][ny][1] = visited[x][y][0] + 1
      q.append((nx, ny, 1))

if result == 1e9:
  print("-1")
else:
  print(result)

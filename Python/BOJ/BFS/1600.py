import sys
from collections import deque
readl = sys.stdin.readline

dx = [-1, 1, 0, 0, -2, -1, 1, 2, 2, 1, -1, -2]
dy = [0, 0, -1, 1, 1, 2, 2, 1, -1, -2, -2, -1]

def bfs(k, w, h, board):
  visited = [[[False for _ in range(k+1)] for _ in range(w)] for _ in range(h)]
  q = deque([(0, 0, 0, k)])
  visited[0][0][k] = True
  
  while q:
    x, y, count, horse = q.popleft()
  
    if x == h-1 and y == w-1:
      return count
  
    for i in range(len(dx)):
      if horse == 0 and i >= 4:
        break
        
      nx = x + dx[i]
      ny = y + dy[i]
      nc = count + 1
      
      if not (0 <= nx < h and 0 <= ny < w):
        continue

      if board[nx][ny] == 0:
        # 상하좌우
        if i < 4:
          if not visited[nx][ny][horse]:
            visited[nx][ny][horse] = True
            q.append((nx, ny, nc, horse))
        else: # 말 동작
          nk = max(0, horse - 1)
          if not visited[nx][ny][nk]:
            visited[nx][ny][nk] = True
            q.append((nx, ny, nc, nk))
          
  return -1

k = int(readl())
w, h = map(int, readl().split())
board = [list(map(int, readl().split())) for _ in range(h)]

result = bfs(k, w, h, board)
print(result)

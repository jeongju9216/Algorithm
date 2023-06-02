import sys
from collections import deque
readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def dfs(depth, sCount, yCount):
  if yCount >= 4:
    return

  if depth == 7:
    if sCount >= 4:
      result.add(tuple(sorted(list(princess))))
    return

  possible = set()
  for x, y in princess:
    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < 5 and 0 <= ny < 5):
        continue

      if not visited[nx][ny]:
        possible.add((nx, ny))

  for x, y in possible:
    visited[x][y] = True
    princess.append((x, y))
    dfs(depth + 1, sCount + int(board[x][y] == "S"), yCount + int(board[x][y] == "Y"))
    princess.pop()
    visited[x][y] = False

board = [list(readl().rstrip()) for _ in range(5)]
visited = [[False for _ in range(5)] for _ in range(5)]

princess = deque()
result = set()

for i in range(5):
  for j in range(5):
    if board[i][j] == "S":
      visited[i][j] = True
      princess.append((i, j))
      dfs(1, 1, 0)
      princess.popleft()

print(len(result))

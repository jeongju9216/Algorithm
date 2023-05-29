import sys
readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def bfs(x, y):
  queue = [(x, y)]
  index = 0
  board[x][y] = 1

  while index < len(queue):
    node = queue[index]
    index += 1

    for i in range(4):
      nx = node[0] + dx[i]
      ny = node[1] + dy[i]

      if not (0 <= nx < m and 0 <= ny < n):
        continue
      if board[nx][ny] == 0:
        board[nx][ny] = 1
        queue.append((nx, ny))

  return len(queue)

m, n, k = map(int, readl().split())
board = [[0 for _ in range(n)] for _ in range(m)]
for _ in range(k):
  x1, y1, x2, y2 = map(int, readl().split())
  for i in range(y1, y2):
    for j in range(x1, x2):
      board[i][j] = 1

result = []
for i in range(m):
  for j in range(n):
    if board[i][j] == 0:
      count = bfs(i, j)
      result.append(count)

print(len(result))
for num in sorted(result):
  print(num, end = " ")

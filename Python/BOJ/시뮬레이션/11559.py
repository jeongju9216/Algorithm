import sys; readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def bfs(x, y):
  global isBoom
  
  item = board[x][y]
  q = [(x, y)]
  index = 0
  
  visited = [[False for _ in range(6)] for _ in range(12)]
  visited[x][y] = True

  while index < len(q):
    x, y, = q[index]
    index += 1

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < 12 and 0 <= ny < 6):
        continue

      if board[nx][ny] == item and not visited[nx][ny]:
        visited[nx][ny] = True
        q.append((nx, ny))

  if index >= 4:
    for x, y in q:
      board[x][y] = "."
    isBoom = True
    
def gravity():
  for j in range(6):
    tmpList = []
    for i in range(12):
      if board[i][j] != ".":
        tmpList.append(board[i][j])

    tmpList = ["."] * (12 - len(tmpList)) + tmpList
    for i in range(12):
      board[i][j] = tmpList[i]


board = [list(readl().rstrip()) for _ in range(12)]
result = 0

while True:
  isBoom = False
  for i in range(12):
    for j in range(6):
      if board[i][j] != ".":
        bfs(i, j)

  gravity()
  if not isBoom:
    break
    
  result += 1

print(result)

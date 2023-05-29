import sys
readl = sys.stdin.readline

def bfs(start, isFire):
  queue = start
  index = 0

  while index < len(queue):
    node = queue[index]
    index += 1

    for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
      nx = node[0] + dx
      ny = node[1] + dy
      nc = node[2] + 1

      if not (0 <= nx < h and 0 <= ny < w):
        if isFire:
          continue
        else:
          return nc
      if not (board[nx][ny] == "." and visited[nx][ny] > nc):
        continue

      visited[nx][ny] = nc
      queue.append((nx, ny, nc))
  
  return -1

t = int(readl())
for _ in range(t):
  w, h = map(int, readl().split())
  board = [list(readl().rstrip()) for _ in range(h)]

  visited = [[1e9 for _ in range(w)] for _ in range(h)]
  fire = []
  man = []
  for i in range(h):
    for j in range(w):
      if board[i][j] == "*":
        fire.append((i, j, 0))
        visited[i][j] = 0
      elif board[i][j] == "@":
        man.append((i, j, 0))
        visited[i][j] = 0


  bfs(fire, True)
  result = bfs(man, False)
  
  if result == -1:
    print("IMPOSSIBLE")
  else:
    print(result)

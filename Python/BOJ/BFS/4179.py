import sys
readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def bfs(start, isMan):
  queue = start
  index = 0

  while index < len(queue):
    node = queue[index]
    index += 1

    for i in range(4):
      nx = node[0] + dx[i]
      ny = node[1] + dy[i]
      nc = node[2] + 1

      if not (0 <= nx < r and 0 <= ny < c):
        if isMan: return nc
        else: continue
      if not (visited[nx][ny] > nc and map[nx][ny] == "."):
        continue

      visited[nx][ny] = nc
      queue.append((nx, ny, nc))
  return -1
      
r, c = map(int, readl().split())
map = [list(readl().rstrip()) for _ in range(r)]
visited = [[1e9 for _ in range(c)] for _ in range(r)]

fire = []
man = (0, 0, 0)
for i in range(r):
  for j in range(c):
    if map[i][j] == "F":
      fire.append((i, j, 0))
      visited[i][j] = 0
    elif map[i][j] == "J":
      man = (i, j, 0)
      visited[i][j] = 0

bfs(fire, False)

count = bfs([man], True)

if count == -1:
  print("IMPOSSIBLE")
else:
  print(count)

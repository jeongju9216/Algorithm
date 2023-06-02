import sys
readl = sys.stdin.readline

#seeRed: 적록색약
def bfs(x, y, item, seeRed):
  queue = [(x, y)]
  index = 0
  visited[x][y] = True

  while index < len(queue):
    node = queue[index]
    index += 1

    for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
      nx = node[0] + dx
      ny = node[1] + dy

      if not (0 <= nx < n and 0 <= ny < n):
        continue

      if visited[nx][ny] == False:
        if map[nx][ny] == item:
            visited[nx][ny] = True
            queue.append((nx, ny))
            continue

        if not seeRed:
          if item == "R" and map[nx][ny] == "G":
            visited[nx][ny] = True
            queue.append((nx, ny))
          elif item == "G" and map[nx][ny] == "R":
            visited[nx][ny] = True
            queue.append((nx, ny))

n = int(readl())
map = [list(readl().rstrip()) for _ in range(n)]

visited = [[False for _ in range(n)] for _ in range(n)]
result1 = 0
for i in range(n):
  for j in range(n):
    if visited[i][j]: continue

    result1 += 1
    bfs(i, j, map[i][j], True)

visited = [[False for _ in range(n)] for _ in range(n)]
result2 = 0
for i in range(n):
  for j in range(n):
    if visited[i][j]: continue

    result2 += 1
    bfs(i, j, map[i][j], False)

print(result1, result2)

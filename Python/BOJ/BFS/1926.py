import sys
readl = sys.stdin.readline

n, m = map(int, readl().split())
map = [list(readl().split()) for _ in range(n)]

def bfs(x, y):
  queue = [(x, y)]
  index = 0
  map[i][j] = "0"
  
  while index < len(queue):
    node = queue[index]
    index += 1
  
    for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
      nx = node[0] + dx
      ny = node[1] + dy

      if 0 <= nx < n and 0 <= ny < m and map[nx][ny] == "1":
        queue.append((nx, ny))
        map[nx][ny] = "0"
  return index
  
count = 0
result = 0
for i in range(n):
  for j in range(m):
    if map[i][j] == "1":
      count += 1
      size = bfs(i, j)
      result = max(result, size)
      

print(count)
print(result)

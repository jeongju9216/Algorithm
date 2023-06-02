import sys
readl = sys.stdin.readline

dx = [-2, -1, 1, 2, 2, 1, -1, -2]
dy = [1, 2, 2, 1, -1, -2, -2, -1]

t = int(readl())
for _ in range(t):
  l = int(readl())
  current = list(map(int, readl().split()))
  target = list(map(int, readl().split()))
  
  queue = [(current[0], current[1], 0)]
  index = 0
  
  visited = [[False for _ in range(l)] for _ in range(l)]
  visited[current[0]][current[1]] = True

  result = 0
  while index < len(queue):
    node = queue[index]
    index += 1

    if node[0] == target[0] and node[1] == target[1]:
      result = node[2]
      break
    
    for i in range(8):
      nx = node[0] + dx[i]
      ny = node[1] + dy[i]
      nc = node[2] + 1

      if not (0 <= nx < l and 0 <= ny < l):
        continue
      if visited[nx][ny]:
        continue

      visited[nx][ny] = True
      queue.append((nx, ny, nc))
  
  print(result)

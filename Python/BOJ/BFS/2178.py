import sys
readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

n, m = map(int, readl().rstrip().split())
map = [list(readl().rstrip()) for _ in range(n)]

queue = [(0, 0, 1)]
index = 0
visited = [[False for _ in range(m)] for _ in range(n)]
visited[0][0] = True

result = 0
while index < len(queue):
  node = queue[index]
  index += 1

  if node[0] == n-1 and node[1] == m-1:
    result = node[2]
    break

  for i in range(4):
    nx = node[0] + dx[i]
    ny = node[1] + dy[i]
    nCount = node[2] + 1

    if not (0 <= nx < n and 0 <= ny < m):
      continue
    if not (not visited[nx][ny] and map[nx][ny] == "1"):
      continue

    visited[nx][ny] = True
    queue.append((nx, ny, nCount))

print(result)

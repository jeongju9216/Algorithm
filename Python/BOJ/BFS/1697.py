import sys
readl = sys.stdin.readline

n, k = map(int, readl().split())

visited = set()

result = 0
queue = [(k, 0)]
index = 0
visited.add(k)

while index < len(queue):
  node = queue[index]
  index += 1

  if node[0] == n:
    result = node[1]
    break

  if node[0] % 2 == 0 and int(node[0] / 2) not in visited:
    visited.add(int(node[0] / 2))
    queue.append((int(node[0] / 2), node[1] + 1))

  if node[0] - 1 not in visited:
    visited.add(node[0] - 1)
    queue.append((node[0] - 1, node[1] + 1))

  if node[0] + 1 not in visited:
    visited.add(node[0] + 1)
    queue.append((node[0] + 1, node[1] + 1))

print(result)

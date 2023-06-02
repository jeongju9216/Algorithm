import sys; readl = sys.stdin.readline

def calDistance():
  sum = 0
  for hx, hy in houses:
    dist = 1e9
    for i in range(len(chickens)):
      if visited[i]:
        cx, cy = chickens[i]
        tmp = abs(hx - cx) + abs(hy - cy)
        dist = min(dist, tmp)
        
    sum += dist
      
  return sum

def pick(start, depth):
  global result
  
  if depth == m:
    dist = calDistance()
    result = min(result, dist)
    return

  for i in range(start, len(chickens)):
    if not visited[i]:
      visited[i] = True
      pick(i + 1, depth + 1)
      visited[i] = False
    
# 길이, 개수
n, m = map(int, readl().split())
board = [list(map(int, readl().split())) for _ in range(n)]

houses = []
chickens = []
for i in range(n):
  for j in range(n):
    if board[i][j] == 1:
      houses.append((i, j))
    elif board[i][j] == 2:
      chickens.append((i, j))

visited = [False for _ in range(len(chickens))]

result = 1e9

pick(0, 0)

print(result)

import sys; readl = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]
directions = [
    [],
    [[0], [1], [2], [3]], # 1번 CCTV
    [[0, 1], [2, 3]], # 2번 CCTV
    [[0, 2], [0, 3], [1, 2], [1, 3]], # 3번 CCTV
    [[0, 1, 2], [0, 1, 3], [0, 2, 3], [1, 2, 3]], # 4번 CCTV
    [[0, 1, 2, 3]] # 5번 CCTV
]
# CCTV마다 모든 방향 확인함
# 확인하는 방향을 체크해두고 dfs 하고
# 끝나면 다시 원상복구해서 다른 방향 확인하고

# 좌표 x, y, 방향 리스트(0 ~ 3)
def checking(x, y, d):
  changes = []
  for i in d:
    nx = x + dx[i]
    ny = y + dy[i]

    while 0 <= nx < n and 0 <= ny < m:
      if board[nx][ny] == 0:
        board[nx][ny] = 7
        changes.append((nx, ny))
      elif board[nx][ny] == 6:
        break
      
      nx += dx[i]
      ny += dy[i]
  return changes

def unchecking(changes):
  for x, y in changes:
    board[x][y] = 0
    
def backtracking(index):
  global totalEmptyArea
  
  if index == totalItems:
    count = 0
    for i in range(n):
      count += board[i].count(0)
    totalEmptyArea = min(totalEmptyArea, count)
    return

  x, y, id = items[index]
  for dir in directions[id]:
    changes = checking(x, y, dir)
    backtracking(index + 1)
    unchecking(changes)

n, m = map(int, readl().split())
board = [list(map(int, readl().split())) for _ in range(n)]

totalEmptyArea = 1e9
items = []
for i in range(n):
  for j in range(m):
    if 1 <= board[i][j] <= 5:
      items.append((i, j, board[i][j]))

totalItems = len(items)

backtracking(0)

print(totalEmptyArea)

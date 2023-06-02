import sys; readl = sys.stdin.readline
import copy

def dfs(depth, dir, board):
  global result
  
  if depth == 5:
    return

  board = copy.deepcopy(board)
  for i in range(n):
    newLine = []
    if dir == 0 or dir == 1:
      for j in range(n):
        if board[j][i] != 0:
          newLine.append(board[j][i])
    elif dir == 2 or dir == 3:
      for j in range(n):
        if board[i][j] != 0:
          newLine.append(board[i][j])

    if not newLine:
      continue

    length = len(newLine)
    for j in range(1, length):
      if dir == 0 or dir == 2:
        if newLine[j] == newLine[j-1]:
          newLine[j-1] *= 2
          newLine[j] = -1
      elif dir == 1 or dir == 3:
        if newLine[length-j] == newLine[length-j-1]:
          newLine[length-j] *= 2
          newLine[length-j-1] = -1

    newLine = [num for num in newLine if num != -1]
    
    if dir == 0 or dir == 2:
      newLine = newLine + [0 for _ in range(n - len(newLine))]
    elif dir == 1 or dir == 3:
      newLine = [0 for _ in range(n - len(newLine))] + newLine

    for j in range(n):
      if dir == 0 or dir == 1:
        board[j][i] = newLine[j]
      elif dir == 2 or dir == 3:
        board[i][j] = newLine[j]
    
    result = max(result, max(newLine))
  
  for i in range(4):
    dfs(depth + 1, i, board)

n = int(readl())
board = [list(map(int, readl().split())) for _ in range(n)]

result = 0

for i in range(4):
  dfs(0, i, board)

print(result)

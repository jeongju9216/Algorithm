import sys
readl = sys.stdin.readline

def DaC(x, y, size):
  global result
  
  item = board[x][y]
  if size == 1:
    result += str(item)
    return
  
  isDevide = False
  for i in range(x, x + size):
    if isDevide: break
      
    for j in range(y, y + size):
      if board[i][j] != item:
        isDevide = True
        break

  if isDevide:
    result += "("
    
    half = int(size / 2)
    DaC(x, y, half)
    DaC(x, y + half, half)
    DaC(x + half, y, half)
    DaC(x + half, y + half, half)
    
    result += ")"
  else:
    result += str(item)
  
n = int(readl())
board = [list(map(int, readl().rstrip())) for _ in range(n)]

result = ""
DaC(0, 0, n)
print(result)

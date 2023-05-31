import sys
readl = sys.stdin.readline

def DaC(x, y, size):
  item = board[x][y]

  isDevice = False
  for i in range(x, x + size):
    if isDevice: break
      
    for j in range(y, y + size):
      if board[i][j] != item:
        isDevice = True
        break

  if isDevice:
    newSize = int(size / 3)
    DaC(x, y, newSize)
    DaC(x, y + newSize, newSize)
    DaC(x, y + newSize * 2, newSize)
    
    DaC(x + newSize, y, newSize)
    DaC(x + newSize, y + newSize, newSize)
    DaC(x + newSize, y + newSize * 2, newSize)

    DaC(x + newSize * 2, y, newSize)
    DaC(x + newSize * 2, y + newSize, newSize)
    DaC(x + newSize * 2, y + newSize * 2, newSize)
  else:
    result[item + 1] += 1
n = int(readl())
board = [list(map(int, readl().split())) for _ in range(n)]

result = [0, 0, 0]

DaC(0, 0, n)

for num in result:
  print(num)

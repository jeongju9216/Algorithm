import sys; readl = sys.stdin.readline

def spin(sticker):
  spinSticker = list(zip(*sticker[::-1]))
  return spinSticker

def canPutSticker(x, y, r, c, sticker):
  global board

  for i in range(r):
    for j in range(c):
      if board[x+i][y+j] == 1 and sticker[i][j] == 1:
        return False

  for i in range(r):
    for j in range(c):
      if sticker[i][j] == 1:
        board[x+i][y+j] = 1
  return True

def attach(r, c, sticker):
  for i in range(n - (r - 1)):
    for j in range(m - (c - 1)):
      if canPutSticker(i, j, r, c, sticker):
        return True
  return False
        
# 세로, 가로, 개수
n, m, k = map(int, readl().split())

board = [[0 for _ in range(m)] for _ in range(n)]

stickers = []
for _ in range(k):
  r, c = map(int, readl().split())
  sticker = [list(map(int, readl().split())) for _ in range(r)]
  stickers.append(sticker)

for sticker in stickers:
  for _ in range(4):
    if attach(len(sticker), len(sticker[0]), sticker):
      break
    else:
      sticker = spin(sticker)

result = 0
for i in range(n):
  result += board[i].count(1)

print(result)

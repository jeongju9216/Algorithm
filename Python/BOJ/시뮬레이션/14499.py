import sys; readl = sys.stdin.readline
from collections import deque

# 이동한 칸이 0이면 주사위 바닥에 있는 수가 칸에 복사됨
# 0이 아닌게 있으면 칸의 수가 바닥면으로 복사됨

dx = [0, 0, 0, -1, 1]
dy = [0, 1, -1, 0, 0]

def turnDice(dir):
  global dice
  
  a, b, c, d, e, f = dice
  if dir == 1: #동
    dice = [d, b, a, f, e, c]
  elif dir == 2:
    dice = [c, b, f, a, e, d]
  elif dir == 3:
    dice = [e, a, c, d, f, b]
  elif dir == 4:
    dice = [b, f, c, d, a, e]

n, m, x, y, k = map(int, readl().split())
board = [list(map(int, readl().split())) for _ in range(n)]
commands = list(map(int, readl().split()))

dice = [0] * 6

nx, ny = x, y
for command in commands:
  nx += dx[command]
  ny += dy[command]

  if not (0 <= nx < n and 0 <= ny < m):
    nx -= dx[command]
    ny -= dy[command]
    continue

  turnDice(command)

  if board[nx][ny] == 0:
    board[nx][ny] = dice[-1]
  else:
    dice[-1] = board[nx][ny]
    board[nx][ny] = 0

  print(dice[0])

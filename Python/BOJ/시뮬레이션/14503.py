//
//  14503.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/04.
//

import sys; readLine = sys.stdin.readline

# 북서남동
dx = [-1, 0, 1, 0]; dy = [0, 1, 0, -1]

n, m = map(int, readLine().split())
robot = list(map(int, readLine().split()))
board = [list(map(int, readLine().split())) for _ in range(n)]

result = 0
while True:
  r, c, d = robot[0], robot[1], robot[2]

  # 1번
  if board[r][c] == 0:
    board[r][c] = -1
    result += 1

  canClean = False
  for i in reversed(range(4)):
    nd = (d + i) % 4
    nx = r + dx[nd]
    ny = c + dy[nd]

    # 3번
    if board[nx][ny] == 0:
      canClean = True
      robot = [nx, ny, nd]
      break

  # 2번
  if not canClean:
    # 후진
    nx = r - dx[d]
    ny = c - dy[d]

    if board[nx][ny] == 1:
      break
    else:
      robot = [nx, ny, d]

print(result)

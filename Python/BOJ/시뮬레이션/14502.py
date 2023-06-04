//
//  14502.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/04.
//

import sys; readLine = sys.stdin.readline
from collections import deque
import copy

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def virus(viruses, board):
  q = deque(viruses)

  while q:
    x, y = q.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < m):
        continue

      if board[nx][ny] == 0:
        board[nx][ny] = 2
        q.append((nx, ny))

  return board
  
n, m = map(int, readLine().split())
board = [list(map(int, readLine().split())) for _ in range(n)]

safes = []
viruses = []
for i in range(n):
  for j in range(m):
    if board[i][j] == 0:
      safes.append((i, j))
    elif board[i][j] == 2:
      viruses.append((i, j))

result = 0
for i1 in range(len(safes)):
  for i2 in range(i1+1, len(safes)):
    for i3 in range(i2+1, len(safes)):
      tmp = copy.deepcopy(board)

      tmp[safes[i1][0]][safes[i1][1]] = 1
      tmp[safes[i2][0]][safes[i2][1]] = 1
      tmp[safes[i3][0]][safes[i3][1]] = 1

      virusBoard = virus(viruses, tmp)
      count = 0
      for i in range(n):
        for j in range(m):
          if virusBoard[i][j] == 0:
            count += 1

      result = max(result, count)

print(result)

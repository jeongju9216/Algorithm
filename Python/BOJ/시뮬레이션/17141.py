//
//  17141.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/08.
//

import sys; readLine = sys.stdin.readline
from collections import deque
import copy

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def combinaion(current, start):
  if len(current) == m:
    virusSet.add(tuple(sorted(current)))
    return

  for i in range(start, len(virusArr)):
    if not i in current:
      combinaion(current + [i], start + 1)

def bfs(virusTuple, board):
  board = copy.deepcopy(board)
  visited = [[False for _ in range(m)] for _ in range(n)]

  q = deque()
  for i in virusTuple:
    x, y = virusArr[i]
    q.append((x, y, 0))
    board[x][y] = 3

  maxTime = 0
  count = 0
  while q:
    x, y, time = q.popleft()
    count += 1
    maxTime = max(maxTime, time)
    
    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < n):
        continue

      if board[nx][ny] == 0 or board[nx][ny] == 2:
        board[nx][ny] = 3
        q.append((nx, ny, time + 1))

  
  # print("count: ", count, " / totalCount: ", totalCount)
  # print("maxTime: ", maxTime)
  if count == totalCount:
    return maxTime
  else:
    return 1e9

n, m = map(int, readLine().split())
board = [list(map(int, readLine().split())) for _ in range(n)]

virusArr = []
totalCount = n * n
for i in range(n):
  for j in range(n):
    if board[i][j] == 1:
      totalCount -= 1
    elif board[i][j] == 2:
      virusArr.append((i, j))

virusSet = set()
combinaion([], 0)

result = 1e9
for virusTuple in virusSet:
  time = bfs(virusTuple, board)

  result = min(result, time)

if result == 1e9:
  print("-1")
else:
  print(result)

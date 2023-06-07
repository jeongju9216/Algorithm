//
//  16234.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/07.
//

import sys; readLine = sys.stdin.readline
import copy

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

def bfs(x, y):
  global visited
  
  q = [(x, y)]
  index = 0
  visited[x][y] = True

  while index < len(q):
    x, y = q[index]
    index += 1

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < n and not visited[nx][ny]):
        continue

      diff = abs(board[x][y] - board[nx][ny])
      if l <= diff <= r:
        visited[nx][ny] = True
        q.append((nx, ny))
        
  return q

n, l, r = map(int, readLine().split())
board = [list(map(int, readLine().split())) for _ in range(n)]

result = 0
while True:
  isMove = False

  visited = [[False for _ in range(n)] for _ in range(n)]
  tmpBoard = copy.deepcopy(board)
  
  for i in range(n):
    for j in range(n):
      std = board[i][j]
      
      if not visited[i][j]:
        items = bfs(i, j)
        count = len(items)
        sum = 0

        if count >= 2:
          isMove = True
          
        for x, y in items:
          sum += board[x][y]
        
        for x, y in items:
          tmpBoard[x][y] = sum // count

  board = tmpBoard
  
  if not isMove:
    break
  result += 1

print(result)

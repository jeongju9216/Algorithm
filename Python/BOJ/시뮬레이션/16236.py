//
//  16236.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/07.
//

import sys; readLine = sys.stdin.readline

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

n = int(readLine())
board = [list(map(int, readLine().split())) for _ in range(n)]

sharkSize = 2
for i in range(n):
  for j in range(n):
    if board[i][j] == 9:
      shark = (i, j)
      board[i][j] = 0
      
result = 0
eatCount = 0
while True:
  canEat = False

  q = [(shark[0], shark[1], 0)]
  index = 0
  visited = [[False for _ in range(n)] for _ in range(n)]
  visited[shark[0]][shark[1]] = True

  eatTime = 0
  while index < len(q):
    x, y, time = q[index]
    index += 1

    item = board[x][y]
    if item > 0 and item < sharkSize:
      canEat = True
      eatTime = time
      break
    
    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if not (0 <= nx < n and 0 <= ny < n and not visited[nx][ny]):
        continue

      visited[nx][ny] = True
      if board[nx][ny] <= sharkSize:
        q.append((nx, ny, time + 1))
  
  if canEat:
    fishes = []
    for x, y, time in q:
      if time == eatTime and board[x][y] > 0 and board[x][y] < sharkSize:
        fishes.append((x, y))
    fishes.sort(key = lambda x: (x[0], x[1]))
    
    eattedFish = fishes[0]
    board[eattedFish[0]][eattedFish[1]] = 0
    shark = (eattedFish[0], eattedFish[1])

    result += eatTime
    eatCount += 1
    if sharkSize == eatCount:
      sharkSize += 1
      eatCount = 0
  else:
    break

print(result)

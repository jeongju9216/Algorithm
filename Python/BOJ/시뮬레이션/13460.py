//
//  13460.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/04.
//

import sys; readLine = sys.stdin.readline
from collections import deque

dx = [-1, 1, 0, 0]; dy = [0, 0, -1, 1]

n, m = map(int, readLine().split())
board = [list(map(str, readLine().rstrip())) for _ in range(n)]

start = [0, 0, 0, 0, 0]
for i in range(n):
  for j in range(m):
    if board[i][j] == "R":
      start[0] = i
      start[1] = j
    elif board[i][j] == "B":
      start[2] = i
      start[3] = j

q = deque([start])
visited = [[[[False for _ in range(m)] for _ in range(n)] for _ in range(m)] for _ in range(n)]
visited[start[0]][start[1]][start[2]][start[3]] = True

result = -1
while q:
  redX, redY, blueX, blueY, count = q.popleft()

  if count > 10:
    break

  if board[redX][redY] == "O" and board[blueX][blueY] != "O":
    result = count
    break

  for i in range(4):
    nxRed = redX
    nyRed = redY
    nxBlue = blueX
    nyBlue = blueY

    while 0 <= nxRed < n and 0 <= nyRed < m:
      if board[nxRed][nyRed] != "#" and board[nxRed][nyRed] != "O":
        nxRed += dx[i]
        nyRed += dy[i]
      elif board[nxRed][nyRed] == "#":
        nxRed -= dx[i]
        nyRed -= dy[i]
        break
      else:
        break

    while 0 <= nxBlue < n and 0 <= nyBlue < m:
      if board[nxBlue][nyBlue] != "#" and board[nxBlue][nyBlue] != "O":
        nxBlue += dx[i]
        nyBlue += dy[i]
      elif board[nxBlue][nyBlue] == "#":
        nxBlue -= dx[i]
        nyBlue -= dy[i]
        break
      else:
        break

    if nxRed == nxBlue and nyRed == nyBlue:
      if board[nxRed][nyRed] != "O":
        redDist = abs(nxRed - redX) + abs(nyRed - redY)
        blueDist = abs(nxBlue - blueX) + abs(nyBlue - blueY)

        if redDist > blueDist:
          nxRed -= dx[i]
          nyRed -= dy[i]
        else:
          nxBlue -= dx[i]
          nyBlue -= dy[i]

    if not visited[nxRed][nyRed][nxBlue][nyBlue]:
      visited[nxRed][nyRed][nxBlue][nyBlue] = True
      q.append([nxRed, nyRed, nxBlue, nyBlue, count + 1])

print(result)

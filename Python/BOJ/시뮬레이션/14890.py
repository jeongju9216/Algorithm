//
//  14890.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/07.
//

import sys; readLine = sys.stdin.readline

def counting():
  # 이전 칸과 2칸 이상 차이면 false
  # 이전 칸과 1칸 이상일 때
  # 낮은쪽 방향으로 L만큼 반복하면서 같은 높이면서 visited가 다 false인지 확인
  count = 0

  for i in range(n):
    visited = [False for _ in range(n)]
    canRoad = True
    j = 1
    while j < n and canRoad:
      if abs(board[i][j-1] - board[i][j]) > 1:
        canRoad = False
        break

      if board[i][j] < board[i][j-1]:
        # 현재 위치에 설치
        std = board[i][j]
        for _ in range(l):
          if j >= n or board[i][j] != std or visited[j]:
            canRoad = False
            break
  
          visited[j] = True
          j += 1
        j -= 1
      elif board[i][j] > board[i][j-1]:
        # 이전 위치에 경사로 설치
        std = board[i][j-1]
        for k in range(1, l+1):
          if j-k < 0 or board[i][j-k] != std or visited[j-k]:
            canRoad = False
            break
  
          visited[j-k] = True
      j += 1
    
    if canRoad:
      count += 1

  return count

n, l = map(int, readLine().split())
board = [list(map(int, readLine().split())) for _ in range(n)]

horizontal = counting()

board = list(zip(*board[::-1]))
vertical = counting()

print(horizontal + vertical)

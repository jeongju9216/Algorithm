//
//  14889.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/06.
//

import sys; readLine = sys.stdin.readline
from itertools import combinations

# 절반 멤버를 구함 -> 스타트 멤버
# 나머지 절반이 링크 멤버

# 풀이1: 백트래킹
def backtracking(depth, start):
  global result
  
  if depth == n // 2:
    start = []
    link = []
    for i in range(n):
      if visited[i]: start.append(i)
      else: link.append(i)

    startScore = 0
    for i in start:
      for j in start:
        startScore += board[i][j]

    linkScore = 0
    for i in link:
      for j in link:
        linkScore += board[i][j]

    diff = abs(startScore - linkScore)
    result = min(result, diff)
    return

  for i in range(start, n):
    if not visited[i]:
      visited[i] = True
      backtracking(depth + 1, i + 1)
      visited[i] = False

# 풀이2: 조합
def combi():
  global result
  
  for r1 in combinations(members, n // 2): #3
    start, link = 0, 0
    
    r2 = list(set(members) - set(r1)) #4
    
    for r in combinations(r1, 2): #5
      start += board[r[0]][r[1]]
      start += board[r[1]][r[0]]
    
    for r in combinations(r2, 2): #6
      link += board[r[0]][r[1]]
      link += board[r[1]][r[0]]
    
    result = min(result, abs(start-link)) #7


n = int(readLine().rstrip())
board = [list(map(int, readLine().split())) for _ in range(n)]

members = list(range(n))
visited = [False for _ in range(n)]

result = 1e9
# backtracking(0, 0)
combi()

print(result)

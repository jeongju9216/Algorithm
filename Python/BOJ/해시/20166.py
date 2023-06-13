//
//  20166.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/13.
//

import sys; readLine = sys.stdin.readline
from collections import deque

dx = [-1, -1, 0, 1, 1, 1, 0, -1]
dy = [0, 1, 1, 1, 0, -1, -1, -1]

def bfs(x, y):
    global dict
    q = deque([(x, y, board[x][y], 1)])
    
    while q:
        x, y, word, depth = q.popleft()

        if depth > 5:
            continue
        
        dict[word] = dict.get(word, 0) + 1

        for i in range(8):
            nx = x + dx[i]
            ny = y + dy[i]
            if nx < 0:
                nx += n
            if ny < 0:
                ny += m
            if nx >= n:
                nx -= n
            if ny >= m:
                ny -= m

            q.append((nx, ny, word + board[nx][ny], depth + 1))

n, m, k = map(int, readLine().split())
board = [list(readLine().rstrip()) for _ in range(n)]
arr = [readLine().rstrip() for _ in range(k)]

dict = {}

for i in range(n):
    for j in range(m):
        bfs(i, j)

for string in arr:
    print(dict.get(string, 0))

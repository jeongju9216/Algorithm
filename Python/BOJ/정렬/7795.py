//
//  7795.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/03.
//

import sys; readl = sys.stdin.readline

t = int(readl())
for _ in range(t):
  n, m = map(int, readl().split())
  arrA = sorted(list(map(int, readl().split())))
  arrB = sorted(list(map(int, readl().split())))

  result = 0
  cursor = 0
  for a in arrA:
    while cursor < m and a > arrB[cursor]:
      cursor += 1
    
    result += cursor
    
  print(result)

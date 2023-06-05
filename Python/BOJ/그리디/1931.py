//
//  1931.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
items = []
for _ in range(n):
  start, end = map(int, readLine().split())
  items.append((start, end))

items.sort(key= lambda x: (x[1], x[0]))

result = 0
endTime = 0
for item in items:
  if item[0] >= endTime:
    result += 1
    endTime = item[1]

print(result)

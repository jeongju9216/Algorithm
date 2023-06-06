//
//  11000.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/06.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
arr = []
for _ in range(n):
  item = list(map(int, readLine().split()))
  arr.append((item[0], 1))
  arr.append((item[1], -1))

arr.sort()

result = 0
count = 0
for item in arr:
  count += item[1]
  result = max(result, count)

print(result)

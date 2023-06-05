//
//  2170.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
lines = []
for _ in range(n):
  x, y = map(int, readLine().split())
  lines.append((x, y))

lines.sort()

left = lines[0][0]
right = lines[0][1]
result = 0

for i in range(1, n):
  if right >= lines[i][1]:
    continue

  if lines[i][0] <= right < lines[i][1]:
    right = lines[i][1]
  elif right < lines[i][0]:
    result += right - left
    left = lines[i][0]
    right = lines[i][1]
    
result += right - left
print(result)

//
//  2457.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())

startStd = 301
endStd = 1130

flowers = []
for _ in range(n):
  sm, sd, em, ed = map(int, readLine().split())
  start = sm * 100 + sd
  end = em * 100 + ed

  if end <= startStd or start > endStd:
    continue
    
  flowers.append((start, end))

flowers.sort(key = lambda x: (x[0], -x[1]))

if flowers[0][0] > endStd:
  print("0")
  exit(0)

result = 0
end = 301; cursor = 0
while end <= endStd:
  newEnd = 0
  for i in range(cursor, len(flowers)):
    flower = flowers[i]
    if flower[0] >= flower[1]:
      continue

    if end >= flower[0]:
      if newEnd < flower[1]:
        newEnd = flower[1]
        cursor = i + 1
    else:
      break

  if newEnd > 0:
    end = newEnd
    result += 1
  else:
    break

if end > endStd:
  print(result)
else:
  print("0")

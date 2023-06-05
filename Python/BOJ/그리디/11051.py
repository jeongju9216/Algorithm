//
//  11051.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

t = int(readLine().rstrip())
for _ in range(t):
  n = int(readLine().rstrip())
  arr = list(map(int, readLine().split()))

  result = 0
  maxNum = 0
  for i in range(n-1, -1, -1):
    if arr[i] > maxNum:
      maxNum = arr[i]
    else:
      result += maxNum - arr[i]

  print(result)

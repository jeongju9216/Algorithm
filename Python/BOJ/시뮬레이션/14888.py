//
//  14888.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

def backtracking(current, ops):
  if len(current) == n - 1:
    opSet.add(tuple(current))
    return
  
  for i in range(4):
    if ops[i] > 0:
      ops[i] -= 1
      backtracking(current + [i], ops)
      ops[i] += 1

n = int(readLine())
nums = list(map(int, readLine().split()))
ops = list(map(int, readLine().split()))

opSet = set()
backtracking([], ops)

maxResult = -1e9
minResult = 1e9
for ops in opSet:
  number = nums[0]
  for i in range(n-1):
    op = ops[i]
    if op == 0:
      number += nums[i+1]
    elif op == 1:
      number -= nums[i+1]
    elif op == 2:
      number *= nums[i+1]
    elif op == 3:
      number = int(number / nums[i+1])

  maxResult = max(maxResult, number)
  minResult = min(minResult, number)

print(maxResult)
print(minResult)

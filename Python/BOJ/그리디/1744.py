//
//  1744.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
nums = [int(readLine().rstrip()) for _ in range(n)]

plus = []; minus = []
for num in nums:
  if num > 0:
    plus.append(num)
  else:
    minus.append(num)

plus.sort(reverse=True)
minus.sort()

result = []

i = 0
while i < len(plus):
  if i == len(plus) - 1:
    result.append(plus[i])
    break

  if plus[i] * plus[i+1] > plus[i] + plus[i+1]:
    result.append(plus[i] * plus[i+1])
    i += 2
  else:
    result.append(plus[i])
    i += 1

i = 0
while i < len(minus):
  if i == len(minus) - 1:
    result.append(minus[i])
    break

  if minus[i] * minus[i+1] > minus[i] + minus[i+1]:
    result.append(minus[i] * minus[i+1])
    i += 2
  else:
    result.append(minus[i])
    i += 1

print(sum(result))

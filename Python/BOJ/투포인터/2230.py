//
//  2230.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/08.
//

import sys; readLine = sys.stdin.readline

n, m = map(int, readLine().split())
nums = []
for _ in range(n):
  num = int(readLine().rstrip())
  nums.append(num)

nums.sort()

result = 2000000000
left = 0; right = 1
while left <= right and right < n:
  sub = nums[right] - nums[left]
  if sub == m:
    result = sub
    break
  elif sub > m:
    result = min(result, sub)
    left += 1
  elif sub < m:
    right += 1

print(result)

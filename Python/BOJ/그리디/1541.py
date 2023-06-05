//
//  1541.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

items = readLine().rstrip().split("-")

nums = []
for item in items:
  if "+" in item:
    num = list(map(int, item.split("+")))
    nums.append(sum(num))
  else:
    nums.append(int(item))

result = nums[0]
for i in range(1, len(nums)):
  result -= nums[i]

print(result)

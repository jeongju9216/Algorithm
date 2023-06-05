//
//  11399.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
items = list(map(int, readLine().split()))

items.sort()

result = 0
sum = 0
for item in items:
  sum += item
  result += sum

print(result)

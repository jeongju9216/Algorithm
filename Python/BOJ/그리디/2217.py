//
//  2217.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
items = [int(readLine().rstrip()) for _ in range(n)]

items.sort(reverse=True)

result = 0
for i in range(1, n+1):
  result = max(result, items[i-1] * i)

print(result)

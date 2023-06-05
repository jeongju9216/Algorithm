//
//  11047.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n, k = map(int, readLine().split())
coins = []
for _ in range(n):
  coins.append(int(readLine().rstrip()))

coins.reverse()

result = 0
for coin in coins:
  if coin <= k:
    count = k // coin
    k -= coin * count
    result += count

print(result)

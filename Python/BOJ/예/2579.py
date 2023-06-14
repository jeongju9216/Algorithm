//
//  2579.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/14.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
arr = [0]
for _ in range(n):
    arr.append(int(readLine()))

dp = [0] * (n + 1)
dp[1] = arr[1]
if n >= 2:
    dp[2] = arr[1] + arr[2]
if n >= 3:
    for i in range(3, n+1):
        dp[i] = max(dp[i-2] + arr[i], dp[i-3] + arr[i-1] + arr[i])

print(dp[n])

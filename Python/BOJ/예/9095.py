//
//  9095.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/14.
//

import sys; readLine = sys.stdin.readline

# 1: 1 -> 1
# 2: 1 + 1, 2 -> 2
# 3: 1 + 1 + 1, 1 + 2, 2 + 1, 3 -> 4

t = int(readLine().rstrip())
for _ in range(t):
    n = int(readLine().rstrip())
    dp = [0] * (n + 1)
    dp[1] = 1
    if n >= 2: dp[2] = 2
    if n >= 3: dp[3] = 4
    if n >= 4:
        for i in range(4, n+1):
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]

    print(dp[n])

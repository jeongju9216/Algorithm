//
//  1149.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/14.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
arr = [(0, 0, 0)]
for i in range(1, n+1):
    input = list(map(int, readLine().split()))

    r = min(arr[i-1][1], arr[i-1][2]) + input[0]
    g = min(arr[i-1][0], arr[i-1][2]) + input[1]
    b = min(arr[i-1][0], arr[i-1][1]) + input[2]

    arr.append((r, g, b))

print(min(arr[n]))

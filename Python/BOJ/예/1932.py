//
//  1932.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/14.
//

import sys; readLine = sys.stdin.readline

n = int(readLine().rstrip())
arr = [list(map(int, readLine().split())) for _ in range(n)]

for i in range(1, n):
    length = len(arr[i])
    for j in range(length):
        if j == 0:
            arr[i][j] += arr[i-1][j]
        elif j == length - 1:
            arr[i][j] += arr[i-1][j-1]
        else:
            arr[i][j] += max(arr[i-1][j-1], arr[i-1][j])

print(max(arr[n-1]))

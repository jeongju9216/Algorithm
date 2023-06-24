//
//  17298.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/22.
//

import sys; readLine = sys.stdin.readline

n = int(readLine().rstrip())
arr = list(map(int, readLine().split()))

result = [-1] * n
stack = []
for i in range(n):
    while stack and arr[stack[-1]] < arr[i]:
        result[stack.pop()] = arr[i]
    stack.append(i)

print(*result)

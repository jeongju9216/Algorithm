//
//  1806.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/09.
//

import sys; readLine = sys.stdin.readline

n, s = map(int, readLine().split())
arr = list(map(int, readLine().split()))

result = 1e9
left = 0; right = 0
sum = arr[0]
while left <= right:
    if sum >= s:
        result = min(result, right - left + 1)
        sum -= arr[left]
        left += 1
    else:
        if right + 1 < n:
            right += 1
            sum += arr[right]
        else:
            break

if result == 1e9:
    print("0")
else:
    print(result)

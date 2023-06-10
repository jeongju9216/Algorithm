//
//  22862.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/10.
//

import sys; readLine = sys.stdin.readline

n, k = map(int, readLine().split())
arr = list(map(int, readLine().split()))

left = 0; right = 0
oddCount = 0
length = 0

if arr[left] % 2 == 0 :
    length = 1
else:
    oddCount = 1

while right + 1 < n :
    right += 1

    if arr[right] % 2 != 0 :
        oddCount += 1
        while oddCount > k and left < right :
            if arr[left] % 2 != 0 :
                oddCount -= 1
            left += 1
    length = max(length, right - left - oddCount + 1)

print(length)

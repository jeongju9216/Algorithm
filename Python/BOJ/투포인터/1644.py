//
//  1644.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/09.
//

import sys; readLine = sys.stdin.readline

# n보다 작은 소수들의 배열을 구함

# 작으면 right를 옮김
# 크면 left를 옮김
# 같으면 result를 + 1

n = int(readLine().rstrip())

if n == 1:
    print("0")
    exit(0)

isPrime = [False, False] + [True] * (n - 1)
nums = []
for i in range(2, n + 1):
    if isPrime[i]:
        nums.append(i)
        for j in range(2 * i, n + 1, i):
            isPrime[j] = False

left = 0; right = 0
sum = nums[left]
result = 0
while left <= right:
    if sum >= n:
        if sum == n:
            result += 1
        sum -= nums[left]
        left += 1
    else:
        if right + 1 < len(nums):
            right += 1
            sum += nums[right]
        else:
            break
print(result)

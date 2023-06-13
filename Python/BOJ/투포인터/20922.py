//
//  20922.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/12.
//

import sys; readLine = sys.stdin.readline

# right를 움직이면서 arr 원소가 k 를 넘는지 확인
# k를 넘으면 arr 원소가 k를 넘지 않을 때까지 left를 움직임
# 반복 마지막에 result를 max length로 업데이트

n, k = map(int, readLine().split())
arr = list(map(int, readLine().split()))

left = 0; right = 0
checked = [0 for _ in range(100001)]
checked[arr[left]] = 1
result = 1

while left <= right and right < n:
    right += 1
    if right == n:
        continue
    checked[arr[right]] += 1

    while checked[arr[right]] > k:
        checked[arr[left]] -= 1
        left += 1

    result = max(result, right - left + 1)

print(result)

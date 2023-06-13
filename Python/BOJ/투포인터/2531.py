//
//  2531.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/12.
//

import sys; readLine = sys.stdin.readline

n, d, k, c = map(int, readLine().split())
arr = []
for _ in range(n):
    arr.append(int(readLine().rstrip()))

checked = [0 for _ in range(d + 1)]
left = 0; right = k - 1
result = 0; count = 0

for i in range(left, right + 1):
    checked[arr[i]] += 1
    if checked[arr[i]] == 1:
        count += 1
result = count

while left < n:
    checked[arr[left]] -= 1
    if checked[arr[left]] == 0:
        count -= 1
    left += 1
    
    right += 1
    checked[arr[right % n]] += 1
    if checked[arr[right % n]] == 1:
        count += 1

    if checked[c]:
        result = max(result, count)
    else:
        result = max(result, count + 1)

print(result)

//
//  1543.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import sys; readLine = sys.stdin.readline

s = readLine().rstrip()
target = readLine().rstrip()
length = len(target)

result = 0
i = 0
while i <= len(s) - length:
    if s[i:i+length] == target:
        result += 1
        i += length
        continue

    i += 1

print(result)

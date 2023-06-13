//
//  13414.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/12.
//

import sys; readLine = sys.stdin.readline

k, l = map(int, readLine().split())

dict = {}
count = 0
for _ in range(l):
    input = readLine().rstrip()
    dict[input] = count
    count += 1

sortedKey = sorted(list(dict.keys()), key = lambda x: dict[x])
count = 0
for item in sortedKey:
    print(item)
    count += 1
    if count == k:
        break

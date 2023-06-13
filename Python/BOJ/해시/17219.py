//
//  17219.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/13.
//

import sys; readLine = sys.stdin.readline

n, m = map(int, readLine().split())
dict = {}
for _ in range(n):
    input = list(readLine().rstrip().split())
    dict[input[0]] = input[1]

for _ in range(m):
    input = readLine().rstrip()
    print(dict[input])

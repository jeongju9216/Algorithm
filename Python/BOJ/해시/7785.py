//
//  7785.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/12.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
table = {}
for _ in range(n):
    command = list(readLine().split())
    if command[1] == "enter":
        table[command[0]] = True
    else:
        del table[command[0]]

for name in sorted(table.keys(), reverse=True):
    print(name)

//
//  1351.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/13.
//

import sys; readLine = sys.stdin.readline

def dfs(num):
    num1 = num // p
    num2 = num // q

    if num1 in dict:
        r1 = dict[num1]
    else:
        r1 = dfs(num1)
        dict[num1] = r1

    if num2 in dict:
        r2 = dict[num2]
    else:
        r2 = dfs(num2)
        dict[num2] = r2

    return r1 + r2

n, p, q = map(int, readLine().split())

dict = {}
dict[0] = 1

if n == 0:
    print("1")
else:
    print(dfs(n

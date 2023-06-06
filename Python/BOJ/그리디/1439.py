//
//  1439.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/06.
//

import sys; readLine = sys.stdin.readline

string = readLine().rstrip()
zero = string.split("0")
zero = list(filter(None, zero))

one = string.split("1")
one = list(filter(None, one))

print(min(len(zero), len(one)))

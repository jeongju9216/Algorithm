//
//  2870.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/15.
//

import sys; readLine = sys.stdin.readline
import re

n = int(readLine().rstrip())
arr = []
for _ in range(n):
    input = readLine().rstrip()
    for v in re.split('[a-z]', input):
        if v:
            arr.append(int(v))

arr.sort()

for num in arr:
    print(num)
    

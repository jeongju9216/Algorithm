//
//  1026.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

n = int(readLine())
a = list(map(int, readLine().split()))
b = list(map(int, readLine().split()))

a.sort()
b.sort(reverse=True)

result = 0
for i in range(len(a)):
  result += a[i] * b[i]

print(result)

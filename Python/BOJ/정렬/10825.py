//
//  10825.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/03.
//

import sys; readl = sys.stdin.readline

n = int(readl())
arr = [readl().split() for _ in range(n)]

arr.sort(key = lambda x: (-int(x[1]), int(x[2]), -int(x[3]), x[0]))

for item in arr:
  print(item[0])

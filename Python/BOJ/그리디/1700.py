//
//  1700.py
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/05.
//

import sys; readLine = sys.stdin.readline

# 멀티탭 구멍이 있으면 꽂음
# 멀티탭 구멍이 없으면 빼고 꽂아야 함
# 나중에 안 쓰는걸 뺌
# 나중에 안 쓰는게 없으면 가장 마지막에 쓰는걸 뽑음

n, k = map(int, readLine().split())
items = list(map(int, readLine().split()))

multitap = []
result = 0
for i in range(k):
  item = items[i]
  # 이미 꽂혀 있다면
  if item in multitap:
    continue

  # 구멍이 남아 있다면
  if len(multitap) < n:
    multitap.append(item)
    continue

  # 하나 빼야 함
  outIndex = -1
  afterUsed = items[i+1:]
  # 이후로 사용 안 하는거 뺌
  for j in range(len(multitap)):
    if not multitap[j] in afterUsed:
      outIndex = j
      break

  # 모두 다시 사용하면 가장 마지막에 쓰는걸 뺌
  if outIndex == -1:
    tmpIndex = 0
    for j in range(len(multitap)):
      usedIndex = afterUsed.index(multitap[j])
      if tmpIndex < usedIndex:
        tmpIndex = usedIndex
        outIndex = j
    
  multitap.remove(multitap[outIndex])
  multitap.append(item)
  result += 1

print(result)

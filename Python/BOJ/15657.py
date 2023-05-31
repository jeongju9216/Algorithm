import sys
readl = sys.stdin.readline

def solution(indexes, start):
  if len(indexes) == m:
    for num in indexes:
      print(arr[num], end = " ")
    print("")
    return

  for i in range(start, len(arr)):
    solution(indexes + [i], i)

n, m = map(int, readl().split())
arr = sorted(list(map(int, readl().split())))

solution([], 0)

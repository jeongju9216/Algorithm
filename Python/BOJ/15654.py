import sys
readl = sys.stdin.readline

def solution(indexes):
  if len(indexes) == m:
    for num in indexes:
      print(arr[num], end = " ")
    print("")
    return

  for i in range(0, len(arr)):
    if not i in indexes:
      solution(indexes + [i])

n, m = map(int, readl().split())
arr = sorted(list(map(int, readl().split())))

solution([])

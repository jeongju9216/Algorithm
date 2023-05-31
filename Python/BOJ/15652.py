import sys
readl = sys.stdin.readline

def solution(current, num):
  if len(current) == m:
    for num in current:
      print(num, end = " ")
    print("")
    return

  for i in range(num, n+1):
    solution(current + [i], i)

n, m = map(int, readl().split())

solution([], 1)

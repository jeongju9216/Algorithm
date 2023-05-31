import sys
readl = sys.stdin.readline

def nm(current):
  if len(current) == m:
    for num in current:
      print(num, end = " ")
    print("")
    return

  for i in range(1, n+1):
    if not i in current:
      nm(current + [i])

n, m = map(int, readl().split())

nm([])

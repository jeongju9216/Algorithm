import sys
readl = sys.stdin.readline

def solution(current, start, size):
  if len(current) == 6:
    print(" ".join(map(str, current)))
    return

  for i in range(start, size):
    solution(current + [arr[i]], i + 1, size)
    
while True:
  inputs = list(map(int, readl().rstrip().split()))
  k = inputs[0]
  if k == 0:
    break
  arr = inputs[1:]
  
  solution([], 0, len(arr))
  print("")

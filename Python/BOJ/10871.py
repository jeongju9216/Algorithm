import sys

(n, x) = map(int, sys.stdin.readline().rstrip().split())
arr = list(map(int, sys.stdin.readline().rstrip().split()))

for i in range(n):
  if arr[i] < x:
    print(arr[i], end = " ")

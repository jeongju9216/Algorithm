import sys
readl = sys.stdin.readline

def hanoi(n, current, target):
  if n == 1:
    print(current, target)
    return

  # 1, 2, 3 막대 -> 1 + 2 + 3 = 6
  hanoi(n-1, current, 6 - current - target)
  print(current, target)
  hanoi(n-1, 6 - current - target, target)

n = int(readl())

print(2 ** n - 1)
hanoi(n, 1, 3)

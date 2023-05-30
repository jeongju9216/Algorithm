import sys
readl = sys.stdin.readline

def DaC(a, b, c):
  if b == 1:
    return a % c

  # x^a = x^(a/2) * x^(a /2)
  tmp = DaC(a, b // 2, c)
  if b % 2 == 0:
    return tmp * tmp % c
  else:
    return tmp * tmp * a % c

a, b, c = map(int, readl().split())

print(DaC(a, b, c))

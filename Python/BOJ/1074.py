import sys
readl = sys.stdin.readline

def solution(n, r, c):
  if n == 0:
    return 0
  half = 2 ** (n-1)
  if r < half and c < half:
    return solution(n-1, r, c)
  if r < half and c >= half:
    return half * half + solution(n-1, r, c - half)
  if r >= half and c < half:
    return 2 * half * half + solution(n-1, r - half, c)
  if r >= half and c >= half:
    return 3 * half * half + solution(n-1, r - half, c - half)

n, r, c = map(int, readl().split())

print(solution(n, r, c))

import sys; readl = sys.stdin.readline

str = readl().rstrip()

arr = []
for i in range(len(str)):
  arr.append("".join(str[i:]))

print(*sorted(arr), sep="\n")

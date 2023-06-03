import sys; readl = sys.stdin.readline

n = int(readl())

words = []
for _ in range(n):
  words.append(readl().rstrip())

words = list(set(words))

words.sort()
words.sort(key= len)

print(*words, sep= "\n")

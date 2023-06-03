import sys; readl = sys.stdin.readline

n, c = map(int, readl().split())
nums = list(map(int, readl().split()))

arr = []
dic = dict()

for num in nums:
  if num in dic:
    dic[num] += 1
  else:
    arr.append(num)
    dic[num] = 1

arr.sort(key = lambda x: dic[x], reverse=True)

for num in arr:
  for _ in range(dic[num]):
    print(num, end = " ")


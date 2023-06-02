n, m = map(int, input().split())
picks = list(map(int, input().split()))

arr = [i + 1 for i in range(n)]

result = 0

while picks:
  if arr[0] == picks[0]:
    arr.remove(arr[0])
    picks.remove(picks[0])
  else:
    result += 1
    index = arr.index(picks[0])
    if index < len(arr) / 2:
      arr.append(arr[0])
      arr.remove(arr[0])
    else:
      arr.insert(0, arr[-1])
      arr.pop()

print(result)

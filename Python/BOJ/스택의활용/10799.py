arr = list(input())

count = 0; result = 0
for i in range(len(arr)):
  if arr[i] == "(":
    count += 1
  else:
    prev = arr[i-1]
    count -= 1
    if prev == "(":
      result += count
    else:
      result += 1

print(result)

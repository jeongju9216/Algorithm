n, k = map(int, input().split())
arr = [i+1 for i in range(n)]

result = []
index = 0
for i in range(n):
  index += (k-1)
  if index >= len(arr):
    index %= len(arr)
  result.append(str(arr[index]))
  arr.pop(index)
print("<", ", ".join(result), ">", sep="")

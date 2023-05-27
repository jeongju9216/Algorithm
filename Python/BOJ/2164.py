n = int(input())
arr = [i for i in range(1, n+1)]

index = 0
while index < len(arr) - 1:
  index += 1
  arr.append(arr[index])
  index += 1

print(arr[index])

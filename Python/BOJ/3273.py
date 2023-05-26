n = int(input())
arr = list(map(int, input().split()))
x = int(input())

arr.sort()

left = 0
right = n - 1
result = 0
while left < right:
  sum = arr[left] + arr[right]
  if sum == x:
    result += 1
    left += 1
  elif sum < x:
    left += 1
  elif sum > x:
    right -= 1

print(result)

n = int(input())

result = 0
for _ in range(n):
  arr = list(input())
  
  stack = []
  for char in arr:
    if not stack or stack[-1] != char:
      stack.append(char)
    else:
      while stack and stack[-1] == char:
        stack.pop()

  if not stack:
    result += 1

print(result)

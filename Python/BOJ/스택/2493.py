n = int(input())
inputs = list(map(int, input().split()))
stack = [(1, inputs[0])]
result = [0]

for i in range(1, n):
  while stack:
    if stack[-1][1] >= inputs[i]:
      result.append(stack[-1][0])
      break
    else:
      stack.pop()
      if not stack:
        result.append(0)
        break
  stack.append((i + 1, inputs[i]))

for num in result:
  print(num, end=" ")

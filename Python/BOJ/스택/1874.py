import sys

n = int(sys.stdin.readline().rstrip())
inputs = []
for _ in range(n):
  inputs.append(int(sys.stdin.readline().rstrip()))

inputs = inputs[::-1]

stack = []
result = []
for i in range(1, n+1):
  result += "+"
  stack.append(i)
  while stack:
    if stack[-1] == inputs[-1]:
      result += "-"
      stack.pop()
      inputs.pop()
    else:
      break

if not inputs:
  for op in result:
    print(op)
else:
  print("NO")

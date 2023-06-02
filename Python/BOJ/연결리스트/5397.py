t = int(input())
for _ in range(t):
  string = list(input())
  left = []
  right = []
  for char in string:
    if char == "<":
      if left:
        right.append(left.pop())
    elif char == ">":
      if right:
        left.append(right.pop())
    elif char == "-":
      if left:
        left.pop()
    else:
      left.append(char)
  left += reversed(right)
  print("".join(left))

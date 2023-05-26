import sys

left = list(sys.stdin.readline().rstrip())
right = []
n = len(left)
m = int(sys.stdin.readline().rstrip())

for _ in range(m):
  inputList = list(sys.stdin.readline().rstrip().split())
  command = inputList[0]
  if command == "L":
    if left:
      right.append(left.pop())
  elif command == "D":
    if right:
      left.append(right.pop())
  elif command == "B":
    if left:
      left.pop()
  elif command == "P":
    left.append(inputList[1])

left += reversed(right)
print("".join(left))

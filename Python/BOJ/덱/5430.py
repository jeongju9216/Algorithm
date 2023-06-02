import sys

t = int(sys.stdin.readline().rstrip())
for _ in range(t):
  commands = list(sys.stdin.readline().rstrip())
  n = int(sys.stdin.readline().rstrip())
  inputs = sys.stdin.readline().rstrip()
  if inputs == "[]":
    arr = []
  else:
    arr = list(map(int, inputs[1:-1].split(sep= ",")))

  head = 0; tail = len(arr) - 1
  isReverse = False
  isError = False
  for cmd in commands:
    if cmd == "R":
      isReverse = not isReverse
    elif cmd == "D":
      if head > tail:
        isError = True
        break
      else:
        if isReverse: tail -= 1
        else: head += 1

  if isError:
    print("error")
  elif head > tail:
    print("[]")
  else:
    result = arr[head:tail+1]
    if isReverse:
      result.reverse()
    print("[", end= "")
    for num in result[0:-1]:
      print(num, end= ",")
    print(result[-1], end= "")
    print("]")

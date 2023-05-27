import sys
n = int(sys.stdin.readline().rstrip())

queue = []
index = 0
for _ in range(n):
  command = list(sys.stdin.readline().rstrip().split())
  isEmpty = len(queue) - index == 0
  if command[0] == "push":
    queue.append(command[1])
  elif command[0] == "pop":
    if not isEmpty:
      print(queue[index])
      index += 1
    else:
      print("-1")
  elif command[0] == "size":
    print(len(queue) - index)
  elif command[0] == "empty":
    if not isEmpty:  print("0")
    else:  print("1")
  elif command[0] == "front":
    if not isEmpty: print(queue[index])
    else: print("-1")
  elif command[0] == "back":
    if not isEmpty: print(queue[-1])
    else: print("-1")
    

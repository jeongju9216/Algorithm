import sys

list = []
for _ in range(9):
  list.append(int(sys.stdin.readline().rstrip()))

list.sort()

sumValue = sum(list)

removeData = []
for i in range(9):
  for j in range(i+1, 9):
    if sumValue - list[i] - list[j] == 100:
      removeData.append(list[i])
      removeData.append(list[j])

list.remove(removeData[0])
list.remove(removeData[1])

for i in list:
  print(i)

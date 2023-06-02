import sys; readl = sys.stdin.readline
from collections import deque
# N = 0, S = 1
#12시부터 시계방향 순서로 입력

def spin(num, dir):
  # 1: 시계방향, -1: 반시계방향
  gear = gears[num]
  if dir == 1:
    gear.insert(0, gear[-1])
    gear.pop()
  else:
    gear.append(gear[0])
    gear.popleft()
  # print("dir: ", dir, " / num: ", num + 1 , " / gear: ", gear)
  return gear

def applyCommand(num, dir):
  global gears

  spinNums = [(num, dir)]
  
  left = num - 1; right = num
  currentDir = dir
  while left >= 0:
    if gears[left][2] != gears[right][6]:
      if currentDir == 1:
        currentDir = -1
      else:
        currentDir = 1
      spinNums.append((left, currentDir))
    else:
      break
    left -= 1
    right -= 1

  left = num; right = num + 1
  currentDir = dir
  while right < 4:
    if gears[left][2] != gears[right][6]:
      if currentDir == 1:
        currentDir = -1
      else:
        currentDir = 1
      spinNums.append((right, currentDir))
    else:
      break
    left += 1
    right += 1

  for num, dir in spinNums:
    gears[num] = spin(num, dir)


gears = deque([deque(map(int, readl().rstrip())) for _ in range(4)])

k = int(readl())
for _ in range(k):
  num, dir = map(int, readl().split())
  # print()
  # print("===== ", num, " == ", dir, " =====")

  applyCommand(num - 1, dir)
  # for gear in gears:
  #   print(gear)

result = 0
for i in range(4):
  if gears[i][0] == 1:
    result += 2 ** i

print(result)

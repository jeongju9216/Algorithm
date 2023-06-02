import sys
readl = sys.stdin.readline

def backtracking(index, breakCount):
  global result
  if index == n:
    result = max(result, breakCount)
    return

  isExist = False
  for i in range(n):
    if i == index or eggs[i][0] <= 0:
      continue
    isExist = True

    if eggs[index][0] <= 0:
      break
      
    eggs[i][0] -= eggs[index][1]
    eggs[index][0] -= eggs[i][1]

    currentBreak = (eggs[i][0] <= 0) + (eggs[index][0] <= 0)
    backtracking(index + 1, breakCount + currentBreak)
  
    eggs[i][0] += eggs[index][1]
    eggs[index][0] += eggs[i][1]

  if not isExist or eggs[index][0] <= 0:
    backtracking(index + 1, breakCount)
    return
    
n = int(readl())
eggs = []
for _ in range(n):
  eggs.append(list(map(int, readl().split())))

result = 0
backtracking(0, 0)

print(result)

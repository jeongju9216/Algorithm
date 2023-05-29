import sys
readl = sys.stdin.readline
sys.setrecursionlimit(10**6)

def dfs(num):
  global count
  
  visited[num] = True
  team.append(num)

  pick = arr[num]
  if not visited[pick]:
    dfs(pick)
  else:
    if pick in team:
      count += len(team[team.index(pick):])
      
t = int(readl())
for _ in range(t):
  n = int(readl())
  arr = [0] + list(map(int, readl().split()))
  
  visited = [False for _ in range(n + 1)]
  count = 0
  for i in range(1, n+1):
    if not visited[i]:
      team = []
      dfs(i)

  result = n - count
  print(result)

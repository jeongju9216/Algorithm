import sys; readl = sys.stdin.readline
from collections import deque

n, w, l = map(int, readl().split())
trucks = list(reversed(list(map(int, readl().split()))))

current = 0
bridge = deque(0 for _ in range(w))

result = 0
while trucks or current > 0:
  result += 1
  
  if bridge[0] > 0:
    current -= bridge[0]
    
  if trucks and current + trucks[-1] <= l:
    bridge.popleft()
    bridge.append(trucks[-1])
    current += trucks[-1]
    trucks.pop()
  else:
    bridge.popleft()
    bridge.append(0)
    
print(result)

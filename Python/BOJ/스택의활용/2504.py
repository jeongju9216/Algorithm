arr = list(input())

isError = False
tmp = 1; result = 0
stack = []
for i in range(len(arr)):
  char = arr[i]
  if char == "(" or char == "[":
    if char == "(": tmp *= 2
    else: tmp *= 3
      
    stack.append(char)
  else:
    if not stack:
      isError = True
      break

    if char == ")" and stack[-1] == "(":
      stack.pop()
      if arr[i-1] == "(":
        result += tmp
      tmp /= 2
    elif char == "]" and stack[-1] == "[":
      stack.pop()
      if arr[i-1] == "[":
        result += tmp
      tmp /= 3
    else:
      isError = True
      break
  
if isError or stack:
  print("0")
else:
  print(int(result))

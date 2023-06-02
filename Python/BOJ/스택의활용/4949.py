import sys

while True:
  input = sys.stdin.readline().rstrip()
  if input == ".":
    break
  
  arr = list(input)
  isError = False

  stack = []
  for char in arr:
    if char == "(" or char == "{" or char == "[":
      stack.append(char)
    elif char == ")" or char == "}" or char == "]":
      if not stack:
        isError = True
        break
        
      if char == ")":
        if stack[-1] == "(":
          stack.pop()
        else:
          isError = True
          break
      elif char == "}":
        if stack[-1] == "{":
          stack.pop()
        else:
          isError = True
          break
      elif char == "]":
        if stack[-1] == "[":
          stack.pop()
        else:
          isError = True
          break
      
  if isError or stack: print("no")
  else: print("yes")

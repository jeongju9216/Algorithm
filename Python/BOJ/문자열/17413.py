//
//  17413.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import sys; readLine = sys.stdin.readline

str = readLine().rstrip()

stack = []
result = ""
isTag = False
for char in str:
    if char == "<":
        isTag = True

        if stack:
            newString = "".join(stack)
            result += newString[::-1]
            stack = []
        
        stack.append("<")
        continue
    elif char == ">":
        isTag = False
        
        stack.append(">")
        result += "".join(stack)
        
        stack = []
        continue

    if isTag:
        stack.append(char)
        continue

    if char == " ":
        newString = "".join(stack)
        result += newString[::-1] + " "
        stack = []
    else:
        stack.append(char)

if stack:
    result += "".join(stack)[::-1]

print(result)

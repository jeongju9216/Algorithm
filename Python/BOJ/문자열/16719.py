//
//  16719.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import sys; readLine = sys.stdin.readline

def splitWord(left, right):
    if left > right:
        return

    current = left
    for i in range(left, right+1):
        if str[i] < str[current]:
            current = i

    checked[current] = True
    printString = ""
    for i in range(len(str)):
        if checked[i]:
            printString += str[i]
    print(printString)

    splitWord(current + 1, right)
    splitWord(left, current - 1)

str = readLine().rstrip()
checked = [False] * len(str)

splitWord(0, len(str)-1)

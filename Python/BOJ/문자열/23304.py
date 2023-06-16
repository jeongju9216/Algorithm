//
//  23304.py
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import sys; readLine = sys.stdin.readline

def isAkaraka(string):
    if len(string) == 1:
        return True
        
    length = len(string)
    mid = length // 2

    front = string[0:mid]
    if length % 2 == 0:
        tail = string[mid:]
    else:
        tail = string[mid+1:]

    if front != tail[::-1]:
        return False
    
    return isAkaraka(front)

str = readLine().rstrip()

result = isAkaraka(str)
if result:
    print("AKARAKA")
else:
    print("IPSELENTI")

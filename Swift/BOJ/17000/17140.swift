//
//  17140.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/13.
//

import Foundation

func operationR() {
    var maxLength = 0
    var newMap: [[Int]] = []
    for line in A {
        var dict: [Int: Int] = [:]
        
        for num in line where num > 0 {
            dict[num, default: 0] += 1
        }
        
        let arr = dict
            .sorted {
                $0.value != $1.value ? $0.value < $1.value : $0.key < $1.key
            }
            .flatMap {
                [$0.key, $0.value]
            }
        
        maxLength = max(maxLength, arr.count)
        newMap.append(arr)
    }
    
    for i in 0..<newMap.count {
        if newMap[i].count < maxLength {
            newMap[i] += Array(repeating: 0, count: maxLength - newMap[i].count)
        }
    }
    
    A = (0..<min(newMap.count, 100)).map { newMap[$0] }
}

func operationC() {
    var maxLength = 0
    
    let newA: [[Int]] = (0..<A[0].count).map { i in A.map { $0[i] } }
    
    var newMap: [[Int]] = []
    for line in newA {
        var dict: [Int: Int] = [:]
        
        for num in line where num > 0 {
            dict[num, default: 0] += 1
        }
        
        let arr = dict
            .sorted {
                $0.value != $1.value ? $0.value < $1.value : $0.key < $1.key
            }
            .flatMap {
                [$0.key, $0.value]
            }
        
        maxLength = max(maxLength, arr.count)
        newMap.append(arr)
    }
    
    for i in 0..<newMap.count {
        if newMap[i].count < maxLength {
            newMap[i] += Array(repeating: 0, count: maxLength - newMap[i].count)
        }
    }
    
    A = (0..<min(newMap[0].count, 100)).map { i in newMap.map { $0[i] } }
}

let rck = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let r = rck[0], c = rck[1], k = rck[2]
var A: [[Int]] = []
for _ in 0..<3 {
    A.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var time = 0
while time <= 100 {
    if 0..<A.count ~= r-1, 0..<A[0].count ~= c-1, A[r-1][c-1] == k {
        break
    }

    if A.count >= A[0].count {
        operationR()
    } else {
        operationC()
    }
            
    time += 1
}

if time > 100 {
    print("-1")
} else {
    print(time)
}

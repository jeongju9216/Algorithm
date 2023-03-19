//
//  1700.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/19.
//

import Foundation

var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var arr = readLine()!.components(separatedBy: " ").map { Int($0)! }

let holeCount = input[0]
var multitap: [Int] = []
var result = 0

for (i, num) in arr.enumerated() {
    //이미 꽂혀 있음
    if multitap.contains(num) {
        continue
    }
    
    //구멍이 남음
    if multitap.count < holeCount {
        multitap.append(num)
        continue
    }
    
    //빼야 됨
    //안 쓰는 거 -> 가장 나중에 쓰는거
    var outIndex = -1
    let afterArr = arr[(i+1)...]
    //안 쓰는거
    for (k, multitapNumber) in multitap.enumerated() {
        if !afterArr.contains(multitapNumber) {
            outIndex = k
            break
        }
    }
    
    if outIndex == -1 {
        for multitapNumber in multitap {
            outIndex = max(outIndex, afterArr.firstIndex(of: multitapNumber)!)
        }
        outIndex = multitap.firstIndex(of: afterArr[outIndex])!
    }
    
    multitap.remove(at: outIndex)
    multitap.append(num)
    result += 1
}

print(result)

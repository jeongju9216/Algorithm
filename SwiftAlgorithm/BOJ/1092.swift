//
//  1092.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/13.
//

import Foundation

//정렬한 뒤에
//담을 수 있는 index 구하기
//담을 수 있는 것중에서 최소 길이에 넣기

let n = Int(readLine()!)!
let crains = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: >)
var crainCounts: [[Int]] = Array(repeating: [], count: n)

let m = Int(readLine()!)!
let boxes = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: >)

for box in boxes {
    var index = -1

    for i in 0..<n {
        //옮길 수 있는 것 중에서 최소 길이
        let crain = crains[i]
        if crain >= box {
            if index == -1 || crainCounts[i].count < crainCounts[index].count {
                index = i
            }
        }
    }
    
    if index == -1 {
        print(-1)
        exit(0)
    }
    
    crainCounts[index].append(box)
}

print(crainCounts.map { $0.count }.max()!)

//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    
    //1차 통과
//    var progresses = progresses
//    var speeds = speeds
//    while !progresses.isEmpty {
//        for i in (0..<progresses.count) {
//            progresses[i] += speeds[i]
//        }
//
//        var count = 0
//        while progresses.first ?? -1 >= 100 {
//            progresses.removeFirst()
//            speeds.removeFirst()
//
//            count += 1
//        }
//
//        if count > 0 {
//            result.append(count)
//        }
//    }
    
    //2차 통과
    var lastReleaseDay = 0
    for i in (0..<progresses.count) {
        let day = Int(ceil((Double(100 - progresses[i])) / Double(speeds[i])))
        if day > lastReleaseDay {
            lastReleaseDay = day
            result.append(1)
        } else {
            result[result.count-1] += 1
        }
    }
    
    return result
}

let progresses = [99, 1]
let speeds = [100, 90]
print(solution(progresses, speeds))

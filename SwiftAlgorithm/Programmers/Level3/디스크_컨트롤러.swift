//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/01.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    var sortJobs: [[Int]] = jobs
    sortJobs.sort { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
    // print("sortJobs: \(sortJobs)")
    
    var time = 0, total = 0
    while !sortJobs.isEmpty {
        let prevCount = sortJobs.count
        for (i, job) in sortJobs.enumerated() {
            if job[0] <= time {
                time += job[1]
                total += time - job[0]
                
                sortJobs.remove(at: i)
                break
            }
        }
        
        if prevCount == sortJobs.count {
            time += 1
        }
    }
    
    print("time: \(time) / total: \(total)")
    return total > 0 ? total / jobs.count : 0
}

//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/17.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Set(report)
    
    var countDict: [String: Int] = [:]
    var dict: [String: [String]] = [:]
    
    for report in report {
        let ids = report.components(separatedBy: " ")
        dict[ids[0], default: []] += [ids[1]]
        countDict[ids[1], default: 0] += 1
    }
    
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    for (i, id) in id_list.enumerated() {
        let reportPeople: [String] = dict[id] ?? []
        if reportPeople.count == 0 {
            continue
        }
        
        for reportId in reportPeople {
            let count: Int = countDict[reportId] ?? 0
            if count >= k {
                result[i] += 1
            }
        }
    }
    
    return result
}

print(solution(["muzi", "frodo", "apeach", "neo"],
               ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"],
               2))

print(solution(["con", "ryan"],
               ["ryan con", "ryan con", "ryan con", "ryan con"],
               3))

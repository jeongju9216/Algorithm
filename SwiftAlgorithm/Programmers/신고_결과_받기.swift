//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let reports = Array(Set(report)) //신고 중복 제거
    var results = Array(repeating: 0, count: id_list.count)
    
    var reportDicts: [String:[String]] = [:]
    var ids: [String:Int] = [:] //index를 저장하기 위한 딕셔너리
    
    //초기화
    for (index, id) in id_list.enumerated() {
        ids[id] = index
        reportDicts[id] = []
    }
    
    //신고 당한 사람 : 신고한 사람
    for report in reports {
        let splitItem = report.split(separator: " ")
        let reporter = String(splitItem.first!)
        let reported = String(splitItem.last!)
                
        reportDicts[reported]?.append(reporter)
    }
//    print("reportDicts: \(reportDicts)")
    
    //reportDicts을 기반으로 count 증가
    for name in ids.keys {
        let reporters = reportDicts[name]!
        if reporters.count >= k {
            for reporter in reporters {
                results[ids[reporter]!] += 1
            }
        }
    }
    
//    print("results: \(results)")
    
    return results
}

let ids: [String] = ["muzi", "frodo", "apeach", "neo"]
let reports: [String] = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let k: Int = 2

print(solution(ids, reports, k))

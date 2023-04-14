//
//  신고 결과 받기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

//ID로 신고한 사람을 배열로 관리
//신고 카운트도 따로 dictionary로 관리
//id 리스트 순서로 k 이상인 ID 개수 카운팅
//결과에 추가

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportDict: [String: [String]] = [:] //신고한 사람
    var countingDict: [String: Int] = [:] //신고 당한 횟수
    
    for rp in Set(report) {
        let arr = rp.split { $0 == " " }.map { String($0) }
        reportDict[arr[0], default: []].append(arr[1])
        countingDict[arr[1], default: 0] += 1
    }
    
    var result: [Int] = []
    for id in id_list {
        var count: Int = 0
        for reportId in reportDict[id] ?? [] {
            if countingDict[reportId]! >= k {
                count += 1
            }
        }
        result.append(count)
    }
    
    return result
}

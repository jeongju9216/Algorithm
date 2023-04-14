//
//  개인정보 수집 유효기간.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/14.
//

import Foundation

func convertDay(_ string: String) -> Int {
    let arr = string.split { $0 == "." }.map { Int($0)! }
    return arr[0] * 12 * 28 + arr[1] * 28 + arr[2]
}

func convertDay(_ month: Int) -> Int {
    return month * 28
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    let today = convertDay(today)
    
    //id, day
    var dict: [String: Int] = [:]
    for term in terms {
        let arr = term.split { $0 == " " }.map { String($0) }
        let day = convertDay(Int(arr[1])!)
        dict[arr[0]] = day
    }
    
    var result: [Int] = []
    //dict[privacy의 약관 종류] > today - privacy 날짜 -> 날짜 지남
    for (i, privacy) in privacies.enumerated() {
        let arr = privacy.split { $0 == " " }.map { String($0) }
        let day = convertDay(arr[0])
        
        if dict[arr[1]]! <= today - day {
            result.append(i+1)
        }
    }
    
    return result
}

//
//  튜플.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/12.
//

import Foundation

//30분
func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var added: [Bool] = Array(repeating: false, count: 1000000 + 1)
    
    let s = String(s.dropLast(2).dropFirst(2)).replacingOccurrences(of: "},{", with: "|")
    let numberStrs: [String] = s.split { $0 == "|" }.map { String($0) }
    
    let numbers: [[Int]] = numberStrs.map { numberStr in
        numberStr.split { $0 == "," }.map { Int(String($0))! }
    }.sorted { $0.count < $1.count }

    for number in numbers {
        for n in number {
            if !added[n] {
                result.append(n)
                added[n] = true
            }
        }
    }
    
    return result
}

//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/23.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let losted = lost.filter{ !reserve.contains($0) }.sorted()
    var reserved = reserve.filter{ !lost.contains($0) }.sorted()

    var result = n - losted.count
    for lost in losted {
        for i in 0..<reserved.count {
            if lost == reserved[i]-1 || lost == reserved[i]+1 {
                reserved.remove(at: i)
                result += 1
                
                break
            }
        }
    }

    return result
}

let n = 5
let lost = [2, 4]
let reserve = [3]
print(solution(n, lost, reserve))

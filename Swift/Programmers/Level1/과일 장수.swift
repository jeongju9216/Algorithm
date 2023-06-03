//
//  과일 장수.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    //내림차순 정렬
    let sorted: [Int] = score.sorted(by: >)
    var result: Int = 0
    var cnt: Int = 0
    for item in sorted {
        if item <= k {
            cnt += 1
        }
        
        if cnt == m {
            result += (item * m)
            
            cnt = 0
        }
    }
    
    return result
}

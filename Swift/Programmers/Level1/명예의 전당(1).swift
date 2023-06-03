//
//  명예의 전당(1).swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/14.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result: [Int] = []
    var arr: [Int] = []
    for num in score {
        arr.sort(by: >)
        if result.count < k {
            arr.append(num)
        }
        
        if let last = arr.last, last < num {
            arr.removeLast()
            arr.append(num)
        }
        
        result.append(arr.min()!)
    }
    
    return result
}

//
//  명예의 전당 (1).swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    //점수를 넣고
    //score를 정렬
    //score에서 k번째 index를 result에 삽입
    //만약 score의 길이가 k보다 작다면 마지막 원소 삽입
    
    var sorted: [Int] = []
    var result: [Int] = []
    for i in 0..<score.count {
        sorted.append(score[i])
        sorted = sorted.sorted(by: >)
                
        if sorted.count <= k {
            result.append(sorted.last!)
        } else {
            result.append(sorted[k-1])
        }
    }
    
    return result
}

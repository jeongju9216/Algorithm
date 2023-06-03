//
//  귤 고르기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    //해시 테이블에 크기의 개수를 저장함
    //개수를 내림차순으로 정렬함
    //종류의 개수 최소값을 구함
    
    var dict: [Int: Int] = [:]
    for item in tangerine {
        dict[item, default: 0] += 1
    }
    
    var counts: [Int] = dict.values.sorted(by: >)
    
    guard k > counts[0] else { //가장 많은 아이템 개수가 k보다 작거나 같으면 무조건 1
        return 1
    }
    
    var k: Int = k
    var result: Int = 0
    
    for count in counts {
        k -= count
        result += 1
        
        if k <= 0 {
            break
        }
    }
    
    return result
}

//
//  롤케이크 자르기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/12.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    
    //토핑 순서는 못 바꿈
    //두 개로 분리해서 set으로 토핑 종류 개수를 구함
    //set의 개수가 같으면 공평
    
    var dict: [Int: Int] = [:] //topping, counter
    for item in topping {
        dict[item, default: 0] += 1
    }
    
    var set1: Set<Int> = [] //철수
    var set2: Set<Int> = Set(topping)
    var result: Int = 0
    
    for item in topping {
        set1.insert(item)
        dict[item, default: 0] -= 1
        
        if let count = dict[item], count <= 0 {
            set2.remove(item)
        }
        
        if set1.count == set2.count {
            result += 1
        }
    }
    
    return result
}

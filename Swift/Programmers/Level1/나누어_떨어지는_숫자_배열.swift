//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result = arr.filter { $0 % divisor == 0 }.sorted()
    if result.count == 0 {
        result = [-1]
    }
    
    return result
}

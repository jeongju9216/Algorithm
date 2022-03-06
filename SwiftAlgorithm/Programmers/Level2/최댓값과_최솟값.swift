//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/06.
//

import Foundation

func solution(_ s:String) -> String {
    
    let nums: [Int] = s.split(separator: " ").map { Int($0)! }.sorted()
    
    let result = "\(nums.min()!) \(nums.max()!)"
    
    return result
}


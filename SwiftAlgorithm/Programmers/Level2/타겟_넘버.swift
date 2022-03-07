//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/07.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(index: Int, sum: Int) {
        if index == numbers.count {
            if sum == target {
                count += 1
            }
            
            return
        }
        
        dfs(index: index+1, sum: sum + numbers[index])
        dfs(index: index+1, sum: sum - numbers[index])
    }
    
    dfs(index: 0, sum: 0)
    
    return count
}

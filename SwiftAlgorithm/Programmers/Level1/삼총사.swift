//
//  삼총사.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func getCount(_ nums: [Int]) -> Int {
    var result: Int = 0
    
    func dfs(_ index: Int, _ idxes: [Int]) {
        var idxes = idxes
        if idxes.count == 3 {
            let add = nums[idxes[0]] + nums[idxes[1]] + nums[idxes[2]]
            if add == 0 {
                result += 1
            }
            
            return
        }
        
        for i in index..<nums.count {
            if !idxes.contains(i) {
                idxes.append(i)
                dfs(i + 1, idxes)
                idxes.removeLast()
            }
        }
    }
    
    dfs(0, [])
    
    return result
}

func solution(_ number:[Int]) -> Int {
    return getCount(number)
}

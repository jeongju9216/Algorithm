//
//  807.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/08.
//

import Foundation

class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        //col, row의 최댓값만큼 올릴 수 있음
        //최댓값 matrix 생성
        //matrix - input => result
    
        var rowMax: [Int] = Array(repeating: 0, count: grid.count)
        var colMax: [Int] = rowMax
        
        for i in 0..<grid.count {
            rowMax[i] = grid[i].max()!
            for j in 0..<grid[i].count {
                colMax[j] = max(colMax[j], grid[i][j])
            }
        }
    
        var result: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                result += abs(grid[i][j] - min(rowMax[i], colMax[j]))
            }
        }
        
        return result
    }
}

//
//  2373.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/31.
//

import Foundation

class Solution {
    func getMaxNumber(_ grid: [[Int]], _ column: Int, _ row: Int) -> Int {
        var number: Int = 0
        
        for i in column..<column+3 {
            for j in row..<row+3 {
                number = max(number, grid[i][j])
            }
        }
        
        return number
    }
    
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        var mt: [[Int]] = []
        
        for i in 0..<grid.count-2 {
            var arr: [Int] = []
            for j in 0..<grid[0].count-2 {
                arr.append(getMaxNumber(grid, i, j))
            }
            
            mt.append(arr)
        }
        
        return mt
    }
}

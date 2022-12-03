//
//  36.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        //row(가로) 검사
        for row in board {
            let filterArr: [Character] = row.filter { $0.isNumber }
            
            var set: Set<Character> = Set(row)
            set.remove(".")
            
            if filterArr.count != set.count {
                return false
            }
        }
        
        //column(세로) 검사
        for i in 0..<board.count {
            var column: [Character] = []
            for row in board {
                if row[i].isNumber {
                    column.append(row[i])
                }
            }
            
            var set: Set<Character> = Set(column)
            set.remove(".")
            
            if column.count != set.count {
                return false
            }
        }
        
        //box
        for i in stride(from: 0, to: 9, by: 3) {
            for j in stride(from: 0, to: 9, by: 3) {
                var arr: [Character] = []
                for bi in 0..<3 {
                    for bj in 0..<3 {
                        if board[i+bi][j+bj].isNumber {
                            arr.append(board[i+bi][j+bj])
                        }
                    }
                }
                
                var set: Set<Character> = Set(arr)
                set.remove(".")
                
                if arr.count != set.count {
                    return false
                }
            }
        }
        
        return true
    }
}

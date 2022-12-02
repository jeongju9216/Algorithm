//
//  289.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let dx: [Int] = [-1, -1, -1, 0, 1, 1, 1, 0] //세로
        let dy: [Int] = [-1, 0, 1, 1, 1, 0, -1, -1] //가로
        
        var newBoard: [[Int]] = board
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                var count: Int = 0
                for k in 0..<8 { //이웃 검사
                    let newX = i + dx[k]
                    let newY = j + dy[k]
                    if (0..<board.count) ~= newX && (0..<board[i].count) ~= newY {
                        if board[newX][newY] == 1 {
                            count += 1
                        }
                    }
                }
                
                if count == 3 {
                    newBoard[i][j] = 1
                } else if count < 2 || count > 3 {
                    newBoard[i][j] = 0
                }
            }
        }
        
        board = newBoard
    }
}

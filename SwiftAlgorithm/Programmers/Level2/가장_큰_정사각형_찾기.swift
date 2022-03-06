//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/06.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    var board = board
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if i == 0 || j == 0 {
                answer = max(answer, board[i][j])
            } else {
                if board[i-1][j-1] > 0 && board[i][j-1] > 0 && board[i-1][j] > 0 && board[i][j] > 0 {
                    board[i][j] = [board[i-1][j-1], board[i][j-1], board[i-1][j]].min()! + 1
                    answer = max(answer, board[i][j])
                }
            }
        }
    }
    
    return answer * answer
}

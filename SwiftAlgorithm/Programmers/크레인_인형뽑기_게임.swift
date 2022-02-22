//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = 0
    
    var basket: [Int] = []
    var board = board
        
    for move in moves {
        for (index, line) in board.enumerated() {
            let doll = line[move-1]
            
            if doll > 0 {
                board[index][move-1] = 0

                if doll == basket.last {
                    result += 2
                    basket.removeLast()
                } else {
                    basket.append(doll)
                }
                
                break
            }
        }
    }

    return result
}

let board = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))

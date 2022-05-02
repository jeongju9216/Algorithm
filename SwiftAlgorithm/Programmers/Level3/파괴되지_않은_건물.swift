//
//  파괴되지_않은_건물.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/02.
//

import Foundation

func addDegree(_ skillBoard: inout [[Int]]) {
    for i in 1..<skillBoard.count {
        for j in 0..<skillBoard[i].count {
            skillBoard[i][j] += skillBoard[i-1][j]
        }
    }
    
    for i in 0..<skillBoard.count {
        for j in 1..<skillBoard[i].count {
            skillBoard[i][j] += skillBoard[i][j-1]
        }
    }
}

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var board = board
    var skillBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)
    
    //스킬 데미지 계산
    for skill in skill {
        let r1 = skill[1], c1 = skill[2]
        let r2 = skill[3], c2 = skill[4]
        let degree = skill[0] == 1 ? -skill[5] : skill[5]
        
        skillBoard[r1][c1] += degree
        skillBoard[r2+1][c2+1] += degree

        skillBoard[r2+1][c1] -= degree
        skillBoard[r1][c2+1] -= degree
    }

    //스킬 누적합
    addDegree(&skillBoard)

    //스킬 데미지 보드에 적용
    var result = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            board[i][j] += skillBoard[i][j]
            if board[i][j] > 0 {
                result += 1
            }
        }
    }
    
    return result
}
//skill[0]: type. 1 = 공격, 2 = 회복
//r1, c1, r2, c2
//degree: 공격력/회복력

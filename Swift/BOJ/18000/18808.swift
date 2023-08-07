//
//  18808.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/18.
//

import Foundation

typealias Sticker = [[Int]]

//let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

// 90도 회전
func spin(_ sticker: Sticker) -> Sticker {
    var tmp: Sticker = []
    
    for i in 0..<sticker[0].count {
        tmp.append(sticker.map { $0[i] }.reversed())
    }
    
    return tmp
}

func canAttach(_ x: Int, _ y: Int, _ sticker: Sticker) -> Bool {
    for i in 0..<sticker.count {
        for j in 0..<sticker[0].count {
            if sticker[i][j] == 1 && board[x+i][y+j] == 1 {
                return false
            }
        }
    }
    
    for i in 0..<sticker.count {
        for j in 0..<sticker[0].count {
            if sticker[i][j] == 1 {
                board[x+i][y+j] = 1
            }
        }
    }
    
    return true
}

//입력
let nmk = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

var stickers: [Sticker] = []
for _ in 0..<k {
    let rc = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    var sticker: Sticker = []
    for _ in 0..<rc[0] {
        let input = readLine()!.split { $0 == " " }.map { Int($0)! }
        sticker.append(input)
    }
    stickers.append(sticker)
}

// 하나씩 전체를 검사함
for sticker in stickers {
    var sticker = sticker
    var isAttach = false

    for _ in 0..<4 {
//        print(sticker)
        let r = sticker.count
        let c = sticker[0].count
        if n < r || m < c {
            sticker = spin(sticker)
            continue
        }
        
        for i in 0...n-r where !isAttach {
            for j in 0...m-c {
                // 들어갈 수 있으면 넣음
                if canAttach(i, j, sticker) {
                    isAttach = true
                    break
                }
            }
        }
        
        // 못 들어가면 회전해서 다시 검사
        if isAttach {
            break
        } else {
            sticker = spin(sticker)
        }
    }
    
//    print(" ----- isAttach: \(isAttach) ---- ")
//    for line in board {
//        line.forEach { print($0, terminator: " ") }
//        print("")
//    }
}

var result = 0
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 1 {
            result += 1
        }
    }
}

print(result)

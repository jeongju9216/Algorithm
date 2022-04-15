//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/16.
//

import Foundation

struct Car {
    var x: Int
    var y: Int
    var cost: Int
    var prev: Int
}

let dx: [Int] = [-1, 1, 0, 0] //상하좌우
let dy: [Int] = [0, 0, -1, 1]

func solution(_ board:[[Int]]) -> Int {
    let length = board.count
    var visited: [[Int]] = Array(repeating: Array(repeating: Int.max - 500, count: length), count: length)
    
    func moveCar(_ car: Car) {
        for i in 0..<4 {
            let nx = car.x + dx[i]
            let ny = car.y + dy[i]
            var nCost = car.cost + 100
            if car.prev >= 0 && car.prev != i {
                nCost += 500
            }

            if (0..<length) ~= nx && (0..<length) ~= ny {
                if visited[nx][ny] + 500 > nCost && board[nx][ny] == 0 {
                    if visited[nx][ny] > nCost {
                        visited[nx][ny] = nCost
                    }
                    
                    moveCar(Car(x: nx, y: ny, cost: nCost, prev: i))
                }
            }
        }
    }
    
    moveCar(Car(x: 0, y: 0, cost: 0, prev: -1))
    
    return visited.last!.last!
}

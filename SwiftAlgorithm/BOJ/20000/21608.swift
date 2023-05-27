//
//  21608.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/28.
//

import Foundation

typealias Item = (like: Int, blank: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let n = Int(readLine()!)!
var mans: [[Int]] = []
for _ in 0..<n*n {
    mans.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
for man in mans {
    let id: Int = man[0]
    let likes: [Int] = Array(man[1...4])
    
    var seat: (x: Int, y: Int) = (n, n)
    var seatItem: Item = (-1, -1)
    //카운팅
    for i in 0..<n {
        for j in 0..<n {
            guard map[i][j] == 0 else {
                continue
            }
            
            var likeCount = 0
            var blankCount = 0
            
            for k in 0..<4 {
                let nx = i + dx[k]
                let ny = j + dy[k]
                
                guard (0..<n) ~= nx, (0..<n) ~= ny else {
                    continue
                }
                
                if map[nx][ny] == 0 {
                    blankCount += 1
                } else if likes.contains(map[nx][ny]) {
                    likeCount += 1
                }
            }
            
            let newItem: Item = (likeCount, blankCount)
            if seatItem.like < likeCount {
                seat = (i, j)
                seatItem = newItem
            } else if seatItem.like == likeCount {
                if seatItem.blank < blankCount {
                    seat = (i, j)
                    seatItem = newItem
                } else if seatItem.blank == blankCount {
                    if seat.x > i {
                        seat = (i, j)
                        seatItem = newItem
                    } else if seat.x == i {
                        if seat.y > j {
                            seat = (i, j)
                            seatItem = newItem
                        }
                    }
                }
            }
        }
    }
    
    map[seat.x][seat.y] = id
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        let id = map[i][j]
        var likes: [Int] = []
        for man in mans where man[0] == id {
            likes = Array(man[1...4])
            break
        }
        
        var likeCount = 0
        
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            if likes.contains(map[nx][ny]) {
                likeCount += 1
            }
        }
        
        if likeCount > 0 {
            result += Int(pow(10.0, Double(likeCount - 1)))
        }
    }
}

print(result)

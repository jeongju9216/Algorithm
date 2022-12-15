//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let w = input[1], h = input[0]

var map: [[Int]] = []
for _ in 0..<h {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

let dh: [Int] = [-1, 1, 0, 0]
let dw: [Int] = [0, 0, -1, 1]

//다음 칸이 치즈인 빈칸 좌표 구하기
func findFirstCheese() -> (Int, Int)? {
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 {
                return (i, j-1)
            }
        }
    }
    
    return nil
}

func meltingCheese() -> Int {
    var meltingCount: Int = 0

    guard let cheese = findFirstCheese() else { return 0 }
    
    var queue: [(h: Int, w: Int)] = [cheese]
    var index = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)
    visited[cheese.0][cheese.1] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 { //상하좌우
            let nextH = node.h + dh[i]
            let nextW = node.w + dw[i]
            
            if nextH >= 0 && nextH < h && nextW >= 0 && nextW < w {
                if !visited[nextH][nextW] { //방문하지 않은 곳만 확인
                    visited[nextH][nextW] = true
                    
                    if map[nextH][nextW] == 1 { //치즈면 가장자리 치즈임
                        map[nextH][nextW] = 0
                        meltingCount += 1
                    } else if map[nextH][nextW] == 0 { //빈공간 탐색
                        queue.append((nextH, nextW))
                    }
                }
            }
        }
    }
    
    return meltingCount
}

var time: Int = 0
var cheeseCount: Int = 0
while true {
    let meltingCount = meltingCheese()
    if meltingCount == 0 {
        break
    }
    
    cheeseCount = meltingCount
    time += 1
}

print(time)
print(cheeseCount)

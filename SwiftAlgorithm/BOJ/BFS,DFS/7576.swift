//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/01.
//

//7576 토마토
import Foundation

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let w = input[0], h = input[1]
var result = 0
var blankCount = 0, tomatoCount = 0

var boxes: [[Int]] = []
for _ in 0..<h {
    let tomatoes = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    boxes.append(tomatoes)
    blankCount += (tomatoes.filter { $0 == -1 }.count)
}

var queue: [(x: Int, y: Int, day: Int)] = []
let di: [Int] = [1, -1, 0, 0]
let dj: [Int] = [0, 0, -1, 1]

for i in 0..<h {
    for j in 0..<w {
        if boxes[i][j] == 1 {
            queue.append((i, j, 0))
            tomatoCount += 1
        }
    }
}

var index = 0
while index < queue.count {
    let tomato = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nx = tomato.x + di[i]
        let ny = tomato.y + dj[i]
        let nextDay = tomato.day + 1

        if nx >= 0 && nx < h && ny >= 0 && ny < w && boxes[nx][ny] == 0 {
            queue.append((nx, ny, nextDay))
            boxes[nx][ny] = 1
    
            tomatoCount += 1
            result = nextDay
        }
    }
}

if tomatoCount == w * h - blankCount {
    print("\(result)")
} else {
    print(-1)
}

//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/31.
//

import Foundation

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let size = input[0], L = input[1], R = input[2]

var map: [[Int]] = []
for _ in 0..<size {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

func createGuild(start: (Int, Int), visited: inout [[Bool]]) -> [(Int, Int)] {
    var queue: [(x: Int, y: Int)] = [start]
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        let person: Int = map[node.x][node.y]
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            if nextX >= 0 && nextX < size && nextY >= 0 && nextY < size {
                if !visited[nextX][nextY] {
                    let nextPerson = map[nextX][nextY]
                    let diff = abs(person - nextPerson)
                    
                    if diff >= L && diff <= R {
                        visited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }
    }
    
    return queue
}

func makeGuilds() -> Bool {
    var guilds: [[(x: Int, y: Int)]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
    
    for i in 0..<size {
        for j in 0..<size {
            if !visited[i][j] {
                visited[i][j] = true
                let newGuild = createGuild(start: (i, j), visited: &visited)
                guilds.append(newGuild)
            }
        }
    }
    
    for guild in guilds {
        var sum = 0
        for country in guild {
            sum += map[country.x][country.y]
        }

        let avg = Int(floor(Double(sum) / Double(guild.count)))
        for country in guild {
            map[country.x][country.y] = avg
        }
    }
    
//    print("guilds count: \(guilds.count)")
    return guilds.count == (size * size)
}

var result = 0
while true {
    let isFinished = makeGuilds()
    if isFinished {
        break
    }
    result += 1
}

print(result)

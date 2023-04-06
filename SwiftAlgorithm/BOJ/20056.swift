//
//  20056.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, 1, 1, 1, 0, -1, -1 ,-1]

struct FireBall {
    var r: Int
    var c: Int
    var m: Int
    var s: Int
    var d: Int
}

let nmk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nmk[0], m = nmk[1], k = nmk[2]
var map: [[[FireBall]]] = Array(repeating: Array(repeating: [], count: n), count: n)

for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let fireball = FireBall(r: input[0]-1, c: input[1]-1, m: input[2], s: input[3], d: input[4])
    map[fireball.r][fireball.c].append(fireball)
}

func move(_ fireballs: [FireBall], _ tmpMap: inout [[[FireBall]]]) {
    for fireball in fireballs {
        let moving = fireball.s % n
        let nx = (fireball.r + moving * dx[fireball.d] + n) % n
        let ny = (fireball.c + moving * dy[fireball.d] + n) % n
        
        let new = FireBall(r: nx, c: ny, m: fireball.m, s: fireball.s, d: fireball.d)
        tmpMap[nx][ny].append(new)
    }
}

func spread(_ fireballs: [FireBall]) -> [FireBall] {
    guard fireballs.count >= 2 else { return fireballs }
    
    var sumM = 0, sumS = 0
    var sumD = 0
    fireballs.forEach {
        sumM += $0.m
        sumS += $0.s
        sumD += $0.d % 2
    }
    
    let nm = sumM / 5
    let ns = sumS / fireballs.count
    
    if nm == 0 {
        return []
    }
    
    let r = fireballs.first!.r
    let c = fireballs.first!.c
    let nd = sumD == 0 || sumD == fireballs.count ? [0, 2, 4, 6] : [1, 3, 5, 7]
    var news: [FireBall] = []
    for k in 0..<4 {
        let new = FireBall(r: r, c: c, m: nm, s: ns, d: nd[k])
        news.append(new)
    }
    
    return news
}

for _ in 0..<k {
    var tmpMap: [[[FireBall]]] = Array(repeating: Array(repeating: [], count: n), count: n)
    map.forEach { $0.forEach { move($0, &tmpMap) } }
    map = tmpMap
    
    tmpMap = map.map { $0.map { spread($0) } }
    
    map = tmpMap
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        for fireball in map[i][j] {
            result += fireball.m
        }
    }
}

print(result)

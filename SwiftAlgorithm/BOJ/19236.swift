//
//  19236.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/08.
//

import Foundation

//(0, 0)이 상어
//이동 가능 : 빈 칸, 다른 물고기가 있는 칸
//이동 불가능 : 상어 칸, 경계를 넘는 칸
//이동할 수 있는 곳이 나올 때까지 45도 반시계로 회전
//이동할 수 있는 칸이 없으면 이동 안 함 -> 최대 360도 회전 후 break
//서로의 위치를 바꾸면서 이동함 -> 순서 중요

//물고기가 다 이동하면 상어가 이동함
//상어는 한 번에 여러 칸 이동 가능
//물고기 있는 칸으로 가면 물고기를 먹고, 물고기가 가졌던 방향으로 바뀜
//지나가는 칸에 있는 물고기는 먹지 않음 -> 도착 지점의 한 마리만 먹음
//물고기가 없는 칸으로는 이동 못함
//이동할 수 있는 칸이 없으면 종료

//먹을 수 있는 물고기 번호의 합의 최댓값 -> 매번 최고 숫자의 물고기를 먹으면 됨

//0번은 빈칸
//1부터 순서대로 ↑, ↖, ←, ↙, ↓, ↘, →, ↗
let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, -1, -1, -1, 0, 1, 1, 1]

struct Fish {
    var x: Int
    var y: Int
    var d: Int
}

//물고기 수만큼 반복
//반시계 45도 회전 : d + 1
//index로 tmp 이용해서 값 바꾸고 범위 벗어나면 회전(8회 반복)
//map[nx][ny]가 빈 칸이거나 물고기가 있는 칸일 때까지 반복

func dfs(_ fishes: [Fish], _ map: [[Int]], _ sharkX: Int, _ sharkY: Int, _ sum: Int) {
    var map = map
    var fishes = fishes
    
    let fishNumber = map[sharkX][sharkY]
    let sharkDir = fishes[fishNumber].d

    fishes[fishNumber].x = -1
    fishes[fishNumber].y = -1
    fishes[fishNumber].d = -1
    map[sharkX][sharkY] = -1
    
    let sum = sum + fishNumber + 1
    result = max(result, sum)
    
    for i in 0..<16 {
        guard fishes[i].x != -1 else {
            continue
        }
        
        let x = fishes[i].x
        let y = fishes[i].y
        let d = fishes[i].d
        
        var nx = x + dx[d]
        var ny = y + dy[d]
        var nd = d
        while nx < 0 || ny < 0 || nx >= 4 || ny >= 4 || (nx == sharkX && ny == sharkY) {
            nd = (nd + 1) % 8
            nx = x + dx[nd]
            ny = y + dy[nd]
        }
        
        if map[nx][ny] != -1 {
            let tmp = map[nx][ny]
            fishes[tmp].x = x
            fishes[tmp].y = y
        
            fishes[i].x = nx
            fishes[i].y = ny
            fishes[i].d = nd
        
            map[x][y] = tmp
            map[nx][ny] = i
        } else {
            fishes[i].x = nx
            fishes[i].y = ny
            fishes[i].d = nd
        
            map[x][y] = -1
            map[nx][ny] = i
        }
    }
    
    for i in 1..<4 {
        let x = sharkX + dx[sharkDir] * i
        let y = sharkY + dy[sharkDir] * i
        guard (0..<4) ~= x, (0..<4) ~= y else {
            break
        }
        
        if map[x][y] != -1 {
            dfs(fishes, map, x, y, sum)
        }
    }
}


var result = 0

//딕셔너리: num : (x, y, d)
//map: num
var map: [[Int]] = []
var fishes: [Fish] = Array(repeating: Fish(x: -1, y: -1, d: -1), count: 16)
for i in 0..<4 {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var arr: [Int] = []
    for j in stride(from: 0, to: 8, by: 2) {
        arr.append(input[j] - 1)
        fishes[input[j] - 1] = Fish(x: i, y: j / 2, d: input[j+1] - 1)
    }
    map.append(arr)
}

dfs(fishes, map, 0, 0, 0)

print(result)

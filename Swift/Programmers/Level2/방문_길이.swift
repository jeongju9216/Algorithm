//
//  방문_길이.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/02.
//

import Foundation

struct Move {
    var x: Int
    var y: Int
    var nx: Int
    var ny: Int
}

func contains(_ roads: [Move], _ newRoad: Move) -> Bool {
    for road in roads {
        //같은 길로 가는 경우
        if road.x == newRoad.x && road.y == newRoad.y &&
            road.nx == newRoad.nx && road.ny == newRoad.ny {
            return true
        }
         
        //같은 길로 오는 경우
        if road.x == newRoad.nx && road.y == newRoad.ny &&
            road.nx == newRoad.x && road.ny == newRoad.y {
            return true
        }
    }
    
    return false
}

func solution(_ dirs:String) -> Int {
    let size = 11
    var roads: [Move] = []
    var x = 5, y = 5
        
    for dir in dirs {
        let prevX = x, prevY = y
        
        //범위에 맞으면 명령어 실행
        switch dir {
            case "U": if x-1 >= 0 { x -= 1 }
            case "D": if x+1 <= size-1 { x += 1 }
            case "R": if y+1 <= size-1 { y += 1 }
            case "L": if y-1 >= 0 { y -= 1 }
            default: break
        }
        
        //제자리면 continue
        if prevX == x && prevY == y {
            continue
        }
        
        //간 적 없는 길이면 길 추가
        let road = Move(x: prevX, y: prevY, nx: x, ny: y)
        if !contains(roads, road) {
            roads.append(road)
        }
    }

    // print(roads)
    
    return roads.count
}

// U: 위쪽으로 한 칸 가기
// D: 아래쪽으로 한 칸 가기
// R: 오른쪽으로 한 칸 가기
// L: 왼쪽으로 한 칸 가기

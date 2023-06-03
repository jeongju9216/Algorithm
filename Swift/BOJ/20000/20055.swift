//
//  20055.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/09.
//

import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var belt = input
let maxIndex = 2 * n - 1

var inIndex = 0, outIndex = n-1
var robots: [Int] = []
var visited: [Bool] = Array(repeating: false, count: n * 2)
//벨트를 움직이면 올리고 내리는 index가 바뀜
func moveBelt() {
    inIndex -= 1
    if inIndex < 0 {
        inIndex = maxIndex
    }
    
    outIndex -= 1
    if outIndex < 0 {
        outIndex = maxIndex
    }
}

func moveRobot() {
    var tmp: [Int] = []
    for robot in robots {
        visited[robot] = false
        
        //로봇이 내리는 위치에 도달해서 내려버림
        if robot == outIndex {
            continue
        }
        
        var next = robot + 1
        if next > maxIndex {
            next = 0
        }
        
        //내구도가 남아있거나, 로봇이 없는 경우 이동 가능
        if belt[next] >= 1 && !visited[next] {
            belt[next] -= 1
            if belt[next] == 0 {
                zeroCount += 1
            }
            //내릴 차례라 올리지 않음
            if next == outIndex {
                continue
            }
            
            visited[next] = true
            tmp.append(next)
        } else {
            //이동 못 하는 경우 그대로 다시 올려줌
            visited[robot] = true
            tmp.append(robot)
        }
    }
    
    robots = tmp
}

func upRobot() {
    //올리는 자리에 로봇이 없고, 내구도가 남아있을 때 올릴 수 있음
    if !visited[inIndex] && belt[inIndex] >= 1 {
        visited[inIndex] = true
        belt[inIndex] -= 1
        if belt[inIndex] == 0 {
            zeroCount += 1
        }
        
        robots.append(inIndex)
    }
}

var result = 0
var zeroCount = 0
while zeroCount < k {
    result += 1
    
    moveBelt()
    moveRobot()
    upRobot()
}

print(result)

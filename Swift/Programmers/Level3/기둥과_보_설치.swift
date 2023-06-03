//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/29.
//

import Foundation

struct Node {
    var pillar: Bool = false
    var stick: Bool = false
}

func checkPillar(_ map: inout [[Node]], x: Int, y: Int) -> Bool {
    //바닥 || 기둥 위 || 보의 왼쪽 위 || 보의 오른쪽 위
    if y == 0 || map[x][y-1].pillar || map[x][y].stick || (x > 0 && map[x-1][y].stick) {
        return true
    } else {
        return false
    }
}

func checkStick(_ map: inout [[Node]], x: Int, y: Int) -> Bool {
    //기둥이 왼쪽이나 오른쪽에 하나라도 있거나
    //양쪽에 보가 있을 때
    if map[x][y-1].pillar ||
        (x+1 < map.count && map[x+1][y-1].pillar) ||
         (x-1 >= 0 && x < map.count && map[x-1][y].stick && map[x+1][y].stick) {
        return true
    } else {
        return false
    }
}

func checkStructures(_ map: inout [[Node]]) -> Bool {
    for i in 0..<map.count {
        for j in 0..<map.count {
            if map[i][j].pillar && !checkPillar(&map, x: i, y: j) {
                return false
            }
            
            if map[i][j].stick && !checkStick(&map, x: i, y: j) {
                return false
            }
        }
    }
    
    return true
}
 
func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var map: [[Node]] = Array(repeating: [], count: n+1)
    for i in 0...n {
        for _ in 0...n {
            map[i].append(Node(pillar: false, stick: false))
        }
    }
        
    for build in build_frame {
        let x = build[0], y = build[1]
        let structure = build[2]
        let action = build[3]
        
        if action == 0 { //삭제
            if structure == 0 { //기둥
                map[x][y].pillar = false
                if !checkStructures(&map) {
                    map[x][y].pillar = true
                }
            } else { //보
                map[x][y].stick = false
                if !checkStructures(&map) {
                    map[x][y].stick = true
                }
            }
        } else { //추가
            if structure == 0 { //기둥
                 if checkPillar(&map, x: x, y: y) {
                     map[x][y].pillar = true
                 }
            } else { //보
                if checkStick(&map, x: x, y: y) {
                     map[x][y].stick = true
                 }
            }
        }
    }
    
    var result: [[Int]] = []
    //기둥 체크
    for x in 0...n {
        for y in 0...n {
            //기둥 체크
            if map[x][y].pillar {
                result.append([x, y, 0])
            }
            
            //보 체크
            if map[x][y].stick {
                result.append([x, y, 1])
            }
        }
    }
    
    result.sort { $0[0] < $1[0] }
    
    // print(result)
    return result
}

//[x, y, a, b]
//a: 0 기둥 1 보
//b: 0 삭제 1 설치

//입력 좌표에 기둥이 있으면 기둥, 보 설치 가능
//입력 좌표, 입력 좌표 + 1에 보가 있으면 보 설치 가능
//입력 좌표가 바닥이면 기둥만 설치 가능

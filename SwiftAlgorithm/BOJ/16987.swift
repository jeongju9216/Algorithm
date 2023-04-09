//
//  16987.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/09.
//

import Foundation

//각 계란에는 내구도와 무게
//각 계란의 내구도가 상대 계란의 무게만큼 깎인다
//내구도가 0 이하가 되면 계란이 깨진다

let n = Int(readLine()!)!
var eggs: [[Int]] = []
for _ in 0..<n {
    let egg = readLine()!.components(separatedBy: " ").map { Int($0)! }
    eggs.append([egg[0], egg[1]])
}

//반복문으로 현재 드는 계란 index를 전달함
//꺠고 ->

var result = 0
func crash(_ current: Int, _ count: Int) {
    //가장 최근에 든게 가장 오른쪽 계란이면 종료
    if current == n {
        result = max(result, count)
        return
    }
    
    //손에 든 계란이 꺠졌으면 다음 계란으로 이동
    if eggs[current][0] <= 0 {
        crash(current + 1, count)
        return
    }
    
    var isExist = false
    for i in 0..<eggs.count {
        //자기 자신은 칠 수 없음
        if i == current {
            continue
        }
        
        //깨지지 않은 달걀 치기
        if eggs[i][0] > 0 {
            isExist = true
            var crashCount = 0
            eggs[i][0] -= eggs[current][1]
            eggs[current][0] -= eggs[i][1]
            
            if eggs[i][0] <= 0 {
                crashCount += 1
            }
            
            if eggs[current][0] <= 0 {
                crashCount += 1
            }
            
            crash(current + 1, count + crashCount)
            
            eggs[i][0] += eggs[current][1]
            eggs[current][0] += eggs[i][1]
        }
    }
    
    //깰 계란이 없으면 다음 계란으로 이동
    if !isExist {
        crash(current + 1, count)
    }
}

crash(0, 0)

print(result)

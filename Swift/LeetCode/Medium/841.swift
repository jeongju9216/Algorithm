//
//  841.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/29.
//

import Foundation

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        
        var visited: [Bool] = Array(repeating: false, count: rooms.count) //방문 처리
        //0번 노드 방문 -> visited 처리
        //키를 keys에 넣음
        //key를 가지고 있고 방문한 적이 없으면 들어감
        //visited에 true가 있으면 return false
        
        var queue: [Int] = [0]
        var index: Int = 0
        visited[0] = true
        
        while index < queue.count {
            let room: Int = queue[index]
            index += 1
            
            for key in rooms[room] { //키 등록
                if !visited[key] {
                    visited[key] = true
                    queue.append(key)
                }
            }
        }
                
        return (visited.filter { !$0 }.count == 0)
    }
}

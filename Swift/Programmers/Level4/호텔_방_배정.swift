//
//  호텔_방_배정.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/04.
//

import Foundation

var room: [Int64:Int64] = [:]

func findRoomNumber(_ index: Int64) -> Int64 { //빈 방을 return
    guard let nextRoomNumber = room[index] else { //방이 비어있을 경우
        room[index] = index + 1
        
        return index
    }
    
    //방이 차있을 경우
    let nextBlankNumber = findRoomNumber(nextRoomNumber)
    room[index] = nextBlankNumber + 1 //다음 비어 있는 방 표시
    
    return nextBlankNumber
}

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    let result: [Int64] = room_number.map { findRoomNumber($0) }
    
    return result
}

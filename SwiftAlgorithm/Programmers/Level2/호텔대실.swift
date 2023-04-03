//
//  호텔대실.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

func convertMin(_ str: String) -> Int {
    let arr = str.split { $0 == ":" }
    let hour = Int(String(arr[0]))! * 60
    let min = Int(String(arr[1]))!
    return hour + min
}

func solution(_ book_time: [[String]]) -> Int {
    
    let bookTimes = book_time.map { [convertMin($0[0]), convertMin($0[1]) + 10] }.sorted { $0[0] < $1[0] }
    
    var rooms: [Int] = []
    
    for bookTime in bookTimes {
        let start = bookTime[0]
        let end = bookTime[1]
        
        var inputIndex = -1
        for i in 0..<rooms.count {
            if rooms[i] <= start {
                inputIndex = i
                break
            }
        }
        
        if inputIndex > -1 {
            rooms[inputIndex] = end
        } else {
            rooms.append(end)
        }
    }
    
    return rooms.count
}

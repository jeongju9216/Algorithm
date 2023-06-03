 //
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

import Foundation

func createTimeString(_ min: Int) -> String {
    return String(format: "%02d:%02d", min/60, min%60)
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    //String -> Int 분으로 변환
    var timetable: [Int] = timetable.map {
        Int($0.prefix(2))! * 60 + Int($0.suffix(2))!
    }.sorted()
    
    var table: [Int] = []
    var sumOfMin = 540
    for _ in 0..<n { //버스 운영 횟수
        table = []
        for time in timetable {
            //탑승 가능 인원 만큼 태웠다면 break
            //다음 회차 시간이라면 break
            guard table.count < m, time <= sumOfMin else {
                break
            }
            
            table.append(timetable.removeFirst())
        }
        
        sumOfMin += t
    }
    sumOfMin -= t

    if let max = table.max(), table.count == m {
        return createTimeString(max - 1)
    } else {
        return createTimeString(sumOfMin)
    }
}

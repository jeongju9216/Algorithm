//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

import Foundation

func createTimeString(_ hour: Int, _ min: Int) -> String {
    return String(format: "%02d:%02d", hour, min)
}

func createTimeString(_ min: Int) -> String {
    return String(format: "%02d:%02d", min/60, min%60)
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    if timetable.count+1 <= m {
        let pTime = (n-1) * t
        return createTimeString(540 + pTime)
    }
    
    //String -> Int 분으로 변환
    var timetable: [Int] = timetable.map { t in
        let split = t.split { $0 == ":" }.map { Int(String($0))! }
        return split[0] * 60 + split[1]
    }.sorted()
    
    var table: [Int] = []
    var sumOfMin = 540
    for _ in 0..<n { //버스 운영 횟수
        table = []
        for time in timetable {
            guard table.count < m, time <= sumOfMin else {
                break
            }
            
            table.append(timetable.removeFirst())
        }
        
        sumOfMin += t
    }
    sumOfMin -= t

    if let max = table.max(), table.count == m {
        print("max: \(max)")
        return createTimeString(max - 1)
    } else {
        return createTimeString(sumOfMin)
    }
}

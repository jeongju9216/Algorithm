//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/25.
//

func solution(_ a:Int, _ b:Int) -> String {
    let days: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let weekdays: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var resultDay = days[0..<a-1].reduce(0, +) + (b-1)
    resultDay += weekdays.firstIndex(of: "FRI")!

    return weekdays[resultDay % 7]
}

let a = 2, b = 1
print(solution(a, b))

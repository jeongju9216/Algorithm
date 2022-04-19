//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/19.
//

import Foundation

func stringToSecond(_ time: String) -> Double {
    let time = Array(time)
    let h = Double(String(time[0...1]))!
    let m = Double(String(time[3...4]))!
    let s = Double(String(time[6...11]))!
    return s + m * 60 + h * 3600
}

func solution(_ lines:[String]) -> Int {
    // guard lines.count > 1 else {
    //     return lines.count
    // }
    
    var times: [(s: Double, e: Double)] = []
    
    lines.forEach { line in
        let ln = line.split { $0 == " " }.map { String($0) }
        let endTime = stringToSecond(ln[1])
        
        let completeTime = Double(String(ln[2].dropLast()))!
        let startTime = endTime - completeTime
        times.append((startTime, endTime))
    }
    // print("times: \(times)")
    
    var result = 0
    for i in 0..<times.count {
        let count = (times[(i+1)...]).filter { times[i].e + 0.999 > $0.s }.count
        result = max(result, count + 1) //자기 자신 추가
    }
    
    return result
}

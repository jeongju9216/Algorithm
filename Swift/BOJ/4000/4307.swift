//
//  4307.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let mn = readLine()!.split { $0 == " " }.map { Int($0)! }
    //길이, 개미 수
    let m = mn[0], n = mn[1]
    
    var minTime = 0, maxTime = 0
    for _ in 0..<n {
        let input = Int(readLine()!)!
            
        let shortest = min(input, m - input)
        let longest = max(input, m - input)
        
        minTime = max(minTime, shortest)
        maxTime = max(maxTime, longest)
    }
    
    print("\(minTime) \(maxTime)")
}

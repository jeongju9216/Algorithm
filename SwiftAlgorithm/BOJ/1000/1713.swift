//
//  1713.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/28.
//

import Foundation

let n = Int(readLine()!)!
let totalCount = Int(readLine()!)!
let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var dict: [Int: (count: Int, day: Int)] = [:]
for i in 0..<input.count {
    if let _ = dict[input[i]] {
        dict[input[i]]!.count += 1
        continue
    }
    
    if dict.count == n {
        let removeKey = dict.keys.sorted { dict[$0]!.count == dict[$1]!.count ? dict[$0]!.day < dict[$1]!.day : dict[$0]!.count < dict[$1]!.count }.first!
        dict[removeKey] = nil
    }
    
    dict[input[i]] = (1, i)
}

for key in dict.keys.sorted() {
    print(key, terminator: " ")
}

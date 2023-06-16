//
//  3107.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

func makeFull(_ str: String) -> String {
    var arr: [String] = []
    let substr = str.split { $0 == ":" }
    
    for item in substr {
        arr.append(String(repeating: "0", count: 4 - item.count) + item)
    }
    
    return arr.joined(separator: ":")
}

let str = readLine()!.replacingOccurrences(of: "::", with: "-")

if let _ = str.firstIndex(of: "-") {
    let splitArr = str.components(separatedBy: "-")
    let front = makeFull(splitArr[0])
    let after = makeFull(splitArr[1])
    
    let padding = Array(repeating: "0000", count: 8 - (front.count + 1) / 5 - (after.count + 1) / 5)
  
    var result = ""
    if !front.isEmpty {
        result += front + ":"
    }
    
    result += padding.joined(separator: ":")
    
    if !after.isEmpty {
        result += ":" + after
    }
    
    print(result)
} else {
    print(makeFull(str))
}

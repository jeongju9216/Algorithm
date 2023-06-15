//
//  2870.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/15.
//

import Foundation

let n = Int(readLine()!)!

var arr: [String] = []
for _ in 0..<n {
    let input = readLine()!.split { !$0.isNumber }.map { char -> String in
        if let num = Int(char) {
            return String(num)
        } else {
            return String(char.drop { $0 == "0" })
        }
    }
    arr.append(contentsOf: input)
}

arr.sort { ($0.count, $0) < ($1.count, $1) }

for num in arr {
    print(num)
}

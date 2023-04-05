//
//  1158.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nk[0], k = nk[1]

var arr = Array(1...n)
var result: [Int] = []

var count = 1
var index = 0
while result.count < n {
    while arr[index % n] == -1 {
        index += 1
    }

    if count % k == 0 {
        result.append(arr[index % n])
        arr[index % n] = -1
    }
    
    count += 1
    index += 1
}

var string = "<"
for i in 0..<result.count-1 {
    string += "\(result[i]), "
}
string += "\(result.last!)>"
print(string)

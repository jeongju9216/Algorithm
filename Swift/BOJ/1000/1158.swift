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

var index = 0
for i in 0..<n {
    index += k-1
    if index >= arr.count {
        index %= arr.count
    }
    
    result.append(arr[index])
    arr.remove(at: index)
}

var string = "<"
for i in 0..<result.count-1 {
    string += "\(result[i]), "
}
string += "\(result.last!)>"
print(string)

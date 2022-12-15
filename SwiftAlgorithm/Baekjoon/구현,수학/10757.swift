//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/30.
//

//10757 큰 수 A+B
//import Foundation

func convertStr2IntArr(_ string: String) -> [Int] {
    return string.map { Int(String($0))! }
}

func insertZero(_ arr: [Int]) -> [Int] {
    var arr = arr
    let diff = abs(diff)
    for _ in 0 ..< diff {
        arr.insert(0, at: arr.startIndex)
    }
    return arr
}

let input = readLine()!.split { $0 == " " }
var first = convertStr2IntArr(String(input[0]))
var second = convertStr2IntArr(String(input[1]))

let diff = first.count - second.count
if diff < 0 {
    first = insertZero(first)
} else {
    second = insertZero(second)
}

for i in (0 ..< first.count).reversed() {
    first[i] += second[i]
    
    if i > 0 && first[i] >= 10 {
        first[i-1] += 1
        first[i] = first[i] % 10
    }
}

let result = (first.map { String($0) }).joined(separator: "")
print(result)

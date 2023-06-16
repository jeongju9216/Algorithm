//
//  1969.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var arr: [[String]] = []
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    arr.append(input)
}

var dna = ""
var hd = 0
for i in 0..<m {
    var dict = ["A": 0, "T": 0, "G": 0, "C": 0]
    
    for j in 0..<n {
        dict[arr[j][i]]! += 1
    }
    
    let sortedKey = dict.keys.sorted {
        dict[$0]! != dict[$1]! ? dict[$0]! > dict[$1]! : $0 < $1
    }
    
    dna += sortedKey[0]
    for j in 0..<n {
        if arr[j][i] != sortedKey[0] {
            hd += 1
        }
    }
}

print(dna)
print(hd)

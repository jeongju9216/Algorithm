//
//  1063.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/11.
//

import Foundation

typealias Node = (x: Int, y: Int)

let dx = [0, 0, 1, -1, -1, -1, 1, 1]
let dy = [1, -1, 0, 0, 1, -1, 1, -1]
let commands: [String: Int] = ["R": 0, "L": 1, "B": 2, "T": 3,
                               "RT": 4, "LT": 5, "RB": 6, "LB": 7]

let alphabets: [String] = ["A", "B", "C", "D", "E", "F", "G", "H"]
var mapDict: [String: Int] = [:]
for i in 0..<8 {
    mapDict[alphabets[i]] = i
}

let input = readLine()!.components(separatedBy: " ")
let kingInput = Array(input[0]), stoneInput = Array(input[1])
let n = Int(input[2])!

var king: Node = (8 - Int(String(kingInput[1]))!, mapDict[String(kingInput[0])]!)
var stone: Node = (8 - Int(String(stoneInput[1]))!, mapDict[String(stoneInput[0])]!)

for _ in 0..<n {
    let command = readLine()!
    let d = commands[command]!
    
    let nxKing = king.x + dx[d]
    let nyKing = king.y + dy[d]
    
    guard (0..<8) ~= nxKing, (0..<8) ~= nyKing else {
        continue
    }
    
    if nxKing == stone.x && nyKing == stone.y {
        let nxStone = stone.x + dx[d]
        let nyStone = stone.y + dy[d]
        
        guard (0..<8) ~= nxStone, (0..<8) ~= nyStone else {
            continue
        }
        
        stone = (nxStone, nyStone)
    }
    
    king = (nxKing, nyKing)
}

print("\(alphabets[king.y])\(8 - king.x)")
print("\(alphabets[stone.y])\(8 - stone.x)")

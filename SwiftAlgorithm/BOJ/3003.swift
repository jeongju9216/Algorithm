//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/26.
//
//3003 킹, 퀸, 룩, 비숍, 나이트, 폰
//import Foundation

let chessCount = [1, 1, 2, 2, 2, 8]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 0..<input.count {
    print(chessCount[i] - input[i], terminator: " ")
}

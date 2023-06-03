//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ n:Int) -> Int {
    return n > 0 ? (1...n).filter { n % $0 == 0 }.reduce(0, +) : 0
}

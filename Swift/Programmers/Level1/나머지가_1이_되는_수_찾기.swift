//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    return (1..<n).filter { n % $0 == 1 }.min()!
}

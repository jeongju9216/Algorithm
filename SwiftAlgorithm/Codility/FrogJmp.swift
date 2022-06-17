//
//  FrogJmp.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/17.
//

import Foundation

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    return Int(ceil((Double(Y) - Double(X)) / Double(D)))
}

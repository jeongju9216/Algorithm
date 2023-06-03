//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ s:String) -> Bool
{
    let pCount = Array(s).filter { $0 == "p" || $0 == "P" }.count
    let yCount = Array(s).filter { $0 == "y" || $0 == "Y" }.count
    
    return pCount == yCount
}

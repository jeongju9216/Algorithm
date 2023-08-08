//
//  1439.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

//하나로 split 해서 적은 수인거 개수

let input = readLine()!
let cnt1 = input.split { $0 == "0" }.count
let cnt2 = input.split { $0 == "1" }.count

print(min(cnt1, cnt2))

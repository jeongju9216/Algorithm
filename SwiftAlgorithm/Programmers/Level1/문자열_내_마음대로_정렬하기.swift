//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ strings:[String], _ n:Int) -> [String] {
//    let result = strings.sorted().map {
//        (String(Array($0)[n]), $0)
//    }.sorted {
//        $0.0 < $1.0
//    }.map {
//        $0.1
//    }
    
    let result = strings.sorted {
        Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n]
    }

    return result
}

let strings = ["sun", "bed", "car"]
let n = 1
print(solution(strings, n))

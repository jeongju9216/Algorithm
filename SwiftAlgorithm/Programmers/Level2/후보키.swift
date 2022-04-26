//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/26.
//

import Foundation

func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

func solution(_ relation:[[String]]) -> Int {
    let colCount = relation.first!.count
    let tupleCount = relation.count
    print("colCount: \(colCount)")
    
    var keyCases: [Int] = (0..<colCount).map { $0 }
    print("keyCases: \(keyCases)")
    
    var combinations: [[[Int]]] = []
    for i in 1...colCount {
        let combos: [[Int]] = combi(keyCases, i)
        combinations.append(combos)
        // print("combos: \(combos)")
    }
    print("combinations: \(combinations)")
    
    var candidateKeys: [[Int]] = []
    for combination in combinations {
        for combination2 in combination {
            let set = Set(combination2)
            var isMinimal = true
            for key in candidateKeys {
                if set.isSuperset(of: key) {
                    isMinimal = false
                    break
                }
            }
            
            guard isMinimal else { continue }
            
            //유일성 판단
            var dict: [String: Bool] = [:]
            for tp in relation {
                var key: String = ""
                for combi in combination2 {
                    key += tp[combi]
                }

                if let _ = dict[key] { //후보키가 아님
                    break
                } else {
                    dict[key] = true
                }
            }
            
            //최소성 판단
            if dict.count == tupleCount {
                candidateKeys.append(combination2)
            }
        }
    }
    
    print("candidateKeys: \(candidateKeys)")
    return candidateKeys.count
}

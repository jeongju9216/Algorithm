//
//  오픈채팅방.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/07.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var results: [String] = []
    let actions: [String: String] = ["Enter": "님이 들어왔습니다.", "Leave": "님이 나갔습니다."]
    
    var records: [(action: String, uid: String)] = []
    var names: [String: String] = [:]
    
    for record in record {
        let input = record.split { $0 == " " }.map { String($0) }
        
        if input[0] != "Change" {
            records.append((input[0], input[1]))
        }
        
        if input.count == 3 {
            names.updateValue(input[2], forKey: input[1])
        }
    }
    
    for record in records {
        results.append("\(names[record.uid] ?? "")\(actions[record.action] ?? "")")
    }
    
    return results
}

//1234 : Muzi -> Prodo
//4567 Prodo -> Ryan

//(muzi, 1234)님이 들어왔습니다
//(prodo, 4567)님이 들어왔습니다.
//(muzi, 1234)님이 나갔습니다.
//(prodo, 1234)님이 들어왔습니다.

//("Enter", "uid1234")
//("Enter", "uid4567")
//("Leave", "uid1234")
//("Enter", "uid1234")

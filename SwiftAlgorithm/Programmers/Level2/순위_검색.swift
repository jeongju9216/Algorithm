//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/29.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var result: [Int] = []
    var cases: [String: [Int]] = [:]
    
    for info in info {
        let info = info.components(separatedBy: " ")
        let lang = [info[0], "-"]
        let job = [info[1], "-"]
        let career = [info[2], "-"]
        let food = [info[3], "-"]
        
        var scores: [Int] = []
        
        for lang in lang {
            for job in job {
                for career in career {
                    for food in food {
                        let str = lang + job + career + food
                        let score = Int(info[4])!
                        scores.append(score)
                        if let _ = cases[str] {
                            cases[str]?.append(score)
                        } else {
                            cases[str] = [score]
                        }
                    }
                }
            }
        }
    }
    
    cases.keys.forEach { cases[$0]?.sort(by: <) }
        
    for query in query {
        var query = query.components(separatedBy: " ").filter { $0 != "and" }
        let score = Int(query.popLast()!)!
        
        guard let scores = cases[query.joined()] else {
            result.append(0)
            continue
        }
        
        var low = 0
        var high = scores.count - 1
        var mid = 0
        
        while low <= high {
            mid = (low + high) / 2
            if scores[mid] < score {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        result.append(scores.count - low)
    }
    
    return result
}

//개발언어 and 직군 and 경력 and 소울푸드


//import Foundation
//
//struct Info {
//    var language: String
//    var job: String
//    var career: String
//    var food: String
//    var score: String
//}
//
//func solution(_ info:[String], _ query:[String]) -> [Int] {
//    var result: [Int] = []
//
//    var infoes: [Info] = []
//    var queries: [Info] = []
//
//    for info in info {
//        let info = info.split { $0 == " " }.map { String($0) }
//        infoes.append(Info(language: info[0], job: info[1], career: info[2], food: info[3], score: info[4]))
//    }
//
//    for query in query {
//        let query = query.split { $0 == " "}.map { String($0) }.filter { $0 != "and" }
//        queries.append(Info(language: query[0], job: query[1], career: query[2], food: query[3], score: query[4]))
//    }
//
//    for query in queries {
//        var count = 0
//
//        if query.language == "-" && query.job == "-" && query.career == "-" &&
//            query.food == "-" && query.score == "-" {
//            count = infoes.count
//        } else {
//            for info in infoes {
//                guard (query.language == "-" || info.language == query.language),
//                        (query.job == "-" || info.job == query.job),
//                        (query.career == "-" || info.career == query.career),
//                        (query.food == "-" || info.food == query.food),
//                        (query.score == "-" || Int(info.score)! >= Int(query.score)!) else {
//                    continue
//                }
//                count += 1
//            }
//        }
//
//        result.append(count)
//    }
//
//    return result
//}

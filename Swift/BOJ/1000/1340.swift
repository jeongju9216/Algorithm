//
//  1340.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/11.
//

import Foundation

func isYoon(_ year: Int) -> Bool {
    return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
}

enum Month: String {
    case January
    case February, March, April, May, June, July, August, September, October, November, December
    
    var index: Int {
        switch self {
        case .January: return 0
        case .February: return 1
        case .March: return 2
        case .April: return 3
        case .May: return 4
        case .June: return 5
        case .July: return 6
        case .August: return 7
        case .September: return 8
        case .October: return 9
        case .November: return 10
        case .December: return 11
        }
    }
}

let yoonDays: [Double] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // 윤년은 2월29일까지
let days: [Double] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // 평년

let input = readLine()!

let arr = input.split { $0 == "," || $0 == " " || $0 == ":" }.map { String($0) }
let month = Month(rawValue: arr[0])!.index
let day = Double(arr[1])!
let year = Double(arr[2])!
let hour = Double(arr[3])!
let minute = Double(arr[4])!

var result: Double = 0
if isYoon(Int(year)) {
    let sumDay: Double = (0..<month).map { yoonDays[$0] }.reduce(0, +)
    let fullMinutes: Double = 366 * 24 * 60
    result = ((sumDay + day - 1) * 24.0 * 60.0 + hour * 60.0 + minute) / fullMinutes * 100.0
} else {
    let sumDay: Double = (0..<month).map { days[$0] }.reduce(0, +)
    let fullMinutes: Double = 365 * 24 * 60
    result = ((sumDay + day - 1) * 24.0 * 60.0 + hour * 60.0 + minute) / fullMinutes * 100.0
}

print(result)

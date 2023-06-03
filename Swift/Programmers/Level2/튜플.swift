import Foundation

//30분
func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var added: [Bool] = Array(repeating: false, count: 1000000 + 1)
    
    let numbers = String(s.dropLast(2).dropFirst(2)).components(separatedBy: "},{") //[String] 파싱
                    .map { numberStr in numberStr.split { $0 == "," }.map { Int(String($0))! } } //[[Int]] 파싱
                    .sorted { $0.count < $1.count } //길이로 정렬
    
    for number in numbers {
        for n in number {
            if !added[n] {
                result.append(n)
                added[n] = true
            }
        }
    }
    
    return result
}

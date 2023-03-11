import Foundation

let input1: Int = Int(readLine()!)!
let input2: [Int] = readLine()!.map { Int(String($0))! }

print(input1 * input2[2])
print(input1 * input2[1])
print(input1 * input2[0])
print(input1 * (input2[0] * 100 + input2[1] * 10 + input2[2] * 1))



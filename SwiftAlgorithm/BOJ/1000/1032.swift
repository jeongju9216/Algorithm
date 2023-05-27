import Foundation

//2차원 String 배열
//index를 하나하나 하면서
//글자가 다른 index를 저장
//첫 번째 문장에 저장된 index는 ? 로 치환해서 출력

let count: Int = Int(readLine()!)!
var strings: [String] = []

for _ in 0..<count {
    let string = readLine()!
    strings.append(string)
}

var firstString: [Character] = Array(strings[0])
var diffIndex: Set<Int> = []
for i in 0..<firstString.count {
    for j in 1..<count {
        let chars: [Character] = Array(strings[j])
        if chars[i] != firstString[i] {
            diffIndex.insert(i)
            break
        }
    }
}

var result = ""
for i in 0..<firstString.count {
    if diffIndex.contains(i) {
        result += "?"
    } else {
        result += String(firstString[i])
    }
}

print(result)

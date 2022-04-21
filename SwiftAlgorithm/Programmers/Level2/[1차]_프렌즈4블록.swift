import Foundation

let dx = [0, 1, 0, 1], dy = [0, 0, 1, 1]
func checkPop(_ i: Int, _ j: Int, _ board: [[(String, Bool)]]) -> Bool {
    let item = board[i][j].0
    for k in 0..<4 {
        if item != board[i+dx[k]][j+dy[k]].0 {
            return false
        }
    }
    
    return true
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    //보드 만들기, (아이템, 존재 유무)
    var nBoard: [[(String, Bool)]] = []
    nBoard = board.map { $0.map { (String($0), true) } }
    
    var isPop = true
    while isPop { //더이상 터질 게 없을 때까지 반복
        isPop = false
        for i in 0..<nBoard.count-1 { //4개씩 체크
            for j in 0..<nBoard[i].count-1 {
                let item = nBoard[i][j].0
                if !item.isEmpty && checkPop(i, j, nBoard) {
                    isPop = true
                    for k in 0..<4 {
                        nBoard[i+dx[k]][j+dy[k]] = (item, false)
                    }
                }
            }
        }
        
        for i in 0..<n { //내리기
            for j in 0..<m {
                if !nBoard[j][i].1 { //터진거면
                    var count = j-1
                    while count >= 0 && !nBoard[count][i].0.isEmpty {
                        nBoard[count+1][i] = nBoard[count][i]
                        nBoard[count][i] = ("", false)
                        count -= 1
                    }
                }
            }
        }
    }
    
    var result = 0
    for board in nBoard {
        result += board.filter { $0.1 == false }.count
    }
    
    return result
}

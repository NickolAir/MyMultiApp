import UIKit

class TicTacToeApp: MiniApp {
    var title: String {
        return "Tic Tac Toe"
    }
    
    func getViewController() -> UIViewController {
        return TicTacToeViewController()
    }
    
    var currentPlayer: Player = .cross
    var board: [Player?] = Array(repeating: nil, count: 9)

    enum Player {
        case cross
        case circle
    }

    func togglePlayer() {
        currentPlayer = currentPlayer == .cross ? .circle : .cross
    }
    
    func makeMove(at index: Int) -> Bool {
        if board[index] == nil {
            board[index] = currentPlayer
            return true
        }
        return false
    }
    
    func checkForWinner() -> Player? {
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        for combination in winningCombinations {
            if let player = board[combination[0]],
               board[combination[1]] == player,
               board[combination[2]] == player {
                return player
            }
        }
        return nil
    }
    
    func checkForDraw() -> Bool {
        return !board.contains(nil)
    }
}

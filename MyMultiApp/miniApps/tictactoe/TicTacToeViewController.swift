import UIKit

class TicTacToeViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stackViewVertical1: UIStackView!
    @IBOutlet weak var stackViewVertical2: UIStackView!
    @IBOutlet weak var stackViewVertical3: UIStackView!
    @IBOutlet weak var stackViewHorizontal: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let boardView = TicTacToeBoard()
        boardView.translatesAutoresizingMaskIntoConstraints = false
        boardView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        view.addSubview(boardView)
        
        NSLayoutConstraint.activate([
            boardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            boardView.widthAnchor.constraint(equalToConstant: 300),
            boardView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: 300),
            mainStackView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        for _ in 0..<3 {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 5
            
            for _ in 0..<3 {
                let button = UIButton(type: .system)
                button.setTitle("", for: .normal)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                button.backgroundColor = .clear
                buttons.append(button)
                rowStackView.addArrangedSubview(button)
            }
            
            mainStackView.addArrangedSubview(rowStackView)
        }
}

    var game = TicTacToeApp()
    var buttons: [UIButton] = []
    
    @objc func buttonTapped(sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        
        if game.makeMove(at: index) {
            let currentPlayerImage = game.currentPlayer == .cross ? UIImage(named: "close.png") : UIImage(named: "circle.png")
            sender.setImage(currentPlayerImage, for: .normal)
            sender.tintColor = game.currentPlayer == .cross ? .red : .blue
            
            if let winner = game.checkForWinner() {
                label.text = "Победитель: \(winner == .cross ? "X" : "O")"
            } else if game.checkForDraw() {
                label.text = "Ничья!"
            } else {
                game.togglePlayer()
            }
        }
    }
}

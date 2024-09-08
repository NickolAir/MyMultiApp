import UIKit

class CrosswordApp: MiniApp {
    var title: String {
        return "Crossword game"
    }
    
    func getViewController() -> UIViewController {
        return CrosswordViewController()
    }
}

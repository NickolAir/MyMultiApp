import UIKit

class CityApp: MiniApp {
    var title: String {
        return "Current city"
    }
    
    func getViewController() -> UIViewController {
        return CityViewController()
    }
}

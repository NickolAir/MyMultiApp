import UIKit

class WeatherApp: MiniApp {
    var title: String {
        return "Weather App"
    }
    
    func getViewController() -> UIViewController {
        return WeatherAppViewController()
    }
}

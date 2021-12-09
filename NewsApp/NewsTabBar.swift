import UIKit

class NewsTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        
        let ukSportNews = UINavigationController(rootViewController: MoviesViewController())
        ukSportNews.tabBarItem.title = "UK Sports News"
        ukSportNews.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        ukSportNews.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        let newYorkTimes = UINavigationController(rootViewController: NewsViewController())
        newYorkTimes.tabBarItem.title = "New-York Times"
        newYorkTimes.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        newYorkTimes.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        viewControllers = [ukSportNews, newYorkTimes]
    }

   
}

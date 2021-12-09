import Foundation
import UIKit

protocol RouterNews {
    var navController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterNews {
    func initialViewController()
    func showDetailNews(news: PieceOfNews?)
    func initialNewsController()
    func showSportsNewsDetail(news: PieceOfSportsNews?)
}

class Router: RouterProtocol {
  
    
    var navController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    var tabBar: NewsTabBar?
    
    init(navController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navController = navController
        self.assemblyBuilder = assemblyBuilder
    }
    
   
    func initialNewsController() {
        if let navigationController = navController {
            guard let moviesViewController = assemblyBuilder?.createMoviesModule(router: self) else {
                return
            }
            navigationController.viewControllers = [moviesViewController]
        }
    }
    func initialViewController() {
        if let navigationController = navController {
            guard let newsViewController = assemblyBuilder?.createNewsModule(router: self) else {
                return
            }
            navigationController.viewControllers = [newsViewController]
        }
    }
    
    func showDetailNews(news: PieceOfNews?) {
        if let navigationController = navController {
            guard let detailNewsViewController = assemblyBuilder?
                    .createDetailsNewsModule(news: news, router: self) else { return }
            
            navigationController.pushViewController(detailNewsViewController, animated: true)
        }
    }
    
    func showSportsNewsDetail(news: PieceOfSportsNews?) {
        if let navigationController = navController {
            guard let sportsNewsDetail = assemblyBuilder?.createSportNewsDetailModule(news: news, router: self) else { return }
            
            navigationController.pushViewController(sportsNewsDetail, animated: true)
        }
    }
    
}

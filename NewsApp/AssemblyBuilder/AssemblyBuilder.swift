import UIKit

protocol AssemblyBuilderProtocol {
    func createNewsModule(router: RouterProtocol) -> UIViewController
    func createMoviesModule(router: RouterProtocol) -> UIViewController
    func createDetailsNewsModule(news: PieceOfNews?, router: RouterProtocol) -> UIViewController
    func createSportNewsDetailModule(news: PieceOfSportsNews?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {

    func createSportNewsDetailModule(news: PieceOfSportsNews?, router: RouterProtocol) -> UIViewController {
        let view = DetailSportsNewsViewController()
        let networkService = MoviesService()
        let presenter = DetailSportsNewsPresenter(view: view, networkService: networkService, router: router, news: news)
        
        view.presenter = presenter
        return view
    }
    
    func createMoviesModule(router: RouterProtocol) -> UIViewController {
        let view = MoviesViewController()
        let network = MoviesService()
        let moviesPresenter = SportsNewsPresenter(view: view,
                                              network: network,
                                              router: router)
        view.moviesPreseneter = moviesPresenter
        return view
    }
    
    func createNewsModule(router: RouterProtocol) -> UIViewController {
        let view = NewsViewController()
        let networkService = NetworkService()
        let presenter = NewsPresenter(view: view,
                                      networkService: networkService,
                                      router: router)
        view.presenter = presenter
         
        return view
    }
    
    func createDetailsNewsModule(news: PieceOfNews?, router: RouterProtocol) -> UIViewController {
        let view = DetailNewsViewController()
        let networkService = NetworkService()
        let presenter = DetailNewsPresenter(view: view,
                                            networkService: networkService,
                                            router: router,
                                            news: news)
        view.presenter = presenter
        return view
    }
}

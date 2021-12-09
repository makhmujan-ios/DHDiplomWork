import UIKit

protocol SportsNewsViewProtocol: AnyObject {
    func successMovies(news: UKSports)
    func errorMovies(error: Error)
}

protocol SportsNewsViewPresenterProtocol: AnyObject {
    var sportNews: UKSports? { get set }
    init(view: SportsNewsViewProtocol, network: MoviesServiceProtocol, router: RouterProtocol)
    func didSelectSportNews(movies: PieceOfSportsNews?)
    func getSportsNews()
}

class SportsNewsPresenter: SportsNewsViewPresenterProtocol {
    var sportNews: UKSports?
    weak var view: SportsNewsViewProtocol?
    let network: MoviesServiceProtocol!
    let router: RouterProtocol!
    
    required init(view: SportsNewsViewProtocol, network: MoviesServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.network = network
        self.router = router
        getSportsNews()
    }
    
    func getSportsNews() {
        network.getMovies { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let remoteNews):
                    self.sportNews = remoteNews
                    self.view?.successMovies(news: remoteNews)
                case .failure(let error):
                    self.view?.errorMovies(error: error)
                }
            }
        }
    }
    
    func didSelectSportNews(movies: PieceOfSportsNews?) {
        router.showSportsNewsDetail(news: movies)
    }
    
    
}

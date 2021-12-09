import UIKit

protocol NewsViewProtocol: AnyObject {
    func success(news: NewsFeed)
    func failure(error: Error)
}
protocol NewsViewPresenterProtocol: AnyObject {
    var news: NewsFeed? { get set }
    init(view: NewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func didSelectNews(results: PieceOfNews?)
    func getNews()
}

class NewsPresenter: NewsViewPresenterProtocol {
    
    var news: NewsFeed?
    weak var view: NewsViewProtocol?
    let networkService: NetworkServiceProtocol!
    let router: RouterProtocol!
   
    required init(view: NewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getNews()
    }
    
    func getNews() {
        networkService.getNews { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let remoteNews):
                    self.news = remoteNews
                    self.view?.success(news: remoteNews)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func didSelectNews(results: PieceOfNews?) {
        router.showDetailNews(news: results)
    }
}

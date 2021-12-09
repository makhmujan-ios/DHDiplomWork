import Foundation
protocol DetailNewsViewProtocol: AnyObject {
    func setNews(news: PieceOfNews?)
}

protocol DetailNewsPresenterProtocol: AnyObject {
    init(view: DetailNewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, news: PieceOfNews?)
    var news: PieceOfNews? { get set }
    func setNews()
}

class DetailNewsPresenter: DetailNewsPresenterProtocol {
    weak var view: DetailNewsViewProtocol?
    let networkService: NetworkServiceProtocol!
    let router: RouterProtocol!
    var news: PieceOfNews?
    
    required init(view: DetailNewsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, news: PieceOfNews?) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.news = news
    }
    
    func setNews() {
        self.view?.setNews(news: news)
    }
}

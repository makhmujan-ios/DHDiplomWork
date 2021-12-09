import Foundation

protocol DetailSportsNewsViewProtocol: AnyObject {
    func setNews(news: PieceOfSportsNews?)
}

protocol DetailSportsNewsPresenterProtocol: AnyObject {
    init(view: DetailSportsNewsViewProtocol, networkService: MoviesServiceProtocol, router: RouterProtocol, news: PieceOfSportsNews?)
    var news: PieceOfSportsNews? { get set }
    func setNews()
}
class DetailSportsNewsPresenter: DetailSportsNewsPresenterProtocol {
    
    weak var view: DetailSportsNewsViewProtocol?
    let networkService: MoviesServiceProtocol!
    let router: RouterProtocol!
    var news: PieceOfSportsNews?
    
    required init(view: DetailSportsNewsViewProtocol, networkService: MoviesServiceProtocol, router: RouterProtocol, news: PieceOfSportsNews?) {
        self.view = view
        self.networkService = networkService
        self.news = news
        self.router = router
    }
    
    func setNews() {
        self.view?.setNews(news: news)
    }
    
    
    
   
    
  
    

}

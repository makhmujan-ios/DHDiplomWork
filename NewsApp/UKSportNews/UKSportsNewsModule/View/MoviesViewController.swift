import UIKit

class MoviesViewController: UIViewController {

    weak var sportsNewsView: SportsNewsViewProtocol!
    var moviesPreseneter: SportsNewsViewPresenterProtocol!
    
    private let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MoviesCell.self, forCellReuseIdentifier: MoviesCell.moviesID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        tableViewConfigure()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        setupNavigation()
//        tableViewConfigure()
//        view.backgroundColor = .white
    }
    private func setupNavigation() {
        navigationItem.title = "UK Sports News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func tableViewConfigure() {
        view.addSubview(moviesTableView)
        moviesTableView.frame = view.bounds
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesPreseneter.sportNews?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviesCell = tableView.dequeueReusableCell(withIdentifier: MoviesCell.moviesID, for: indexPath) as! MoviesCell
        let movies = moviesPreseneter.sportNews?.articles[indexPath.row]
        moviesCell.moviesTitleLabel.text = movies?.title
        return moviesCell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesPreseneter.didSelectSportNews(movies: moviesPreseneter?.sportNews?.articles[indexPath.row])
    }
}

extension MoviesViewController: SportsNewsViewProtocol {
    func successMovies(news: UKSports) {
        moviesTableView.reloadData()
    }
    
    func errorMovies(error: Error) {
        print(error.localizedDescription)
    }
}

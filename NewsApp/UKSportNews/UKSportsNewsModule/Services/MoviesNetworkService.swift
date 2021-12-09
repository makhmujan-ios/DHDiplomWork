import Foundation

protocol MoviesServiceProtocol {
    func getMovies(completion: @escaping (Result<UKSports, Error>) -> Void)
}
class MoviesService: MoviesServiceProtocol {
    func getMovies(completion: @escaping (Result<UKSports, Error>) -> Void) {
        let apiKey = "2e69294af0664d2a9cc311f8a7c63ac7"
        let urlString = "https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                let response = try decoder.decode(UKSports.self, from: data)
                print(response)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



import UIKit
import WebKit

class DetailSportsNewsViewController: UIViewController {

    var presenter: DetailSportsNewsPresenterProtocol!
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.bounds
        setupWebView()
        presenter.setNews()
    }
    
    private func setupWebView() {
        view.addSubview(webView)
        webView.navigationDelegate = self
    }
}
extension DetailSportsNewsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let cred = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, cred)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}

// MARK: - DetailNewsViewProtocol
extension DetailSportsNewsViewController: DetailSportsNewsViewProtocol {
    func setNews(news: PieceOfSportsNews?) {
        guard let parsedURL = news?.url else { return }
        guard let url = URL(string: parsedURL) else { return }
        webView.load(URLRequest(url: url))
    }
}

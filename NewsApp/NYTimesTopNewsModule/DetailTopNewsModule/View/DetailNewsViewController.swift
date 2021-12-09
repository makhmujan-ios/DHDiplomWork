import UIKit
import WebKit

class DetailNewsViewController: UIViewController {
    var presenter: DetailNewsPresenterProtocol!
    
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

// MARK: - WKNavigationDelegate
extension DetailNewsViewController: WKNavigationDelegate {
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
extension DetailNewsViewController: DetailNewsViewProtocol {
    func setNews(news: PieceOfNews?) {
        guard let parsedURL = news?.url else { return }
        guard let url = URL(string: parsedURL) else { return }
        webView.load(URLRequest(url: url))
    }
}

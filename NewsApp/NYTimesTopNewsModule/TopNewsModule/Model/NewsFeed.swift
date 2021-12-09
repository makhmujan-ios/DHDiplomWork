import Foundation

struct NewsFeed: Decodable {
    let results: [PieceOfNews]
}

struct PieceOfNews: Decodable {
    let title: String
    let url: String
}

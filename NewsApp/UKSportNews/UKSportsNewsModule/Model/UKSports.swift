import Foundation

struct UKSports: Decodable {
    var articles: [PieceOfSportsNews]
}

struct PieceOfSportsNews: Decodable {
    var url: String
    var title: String
}



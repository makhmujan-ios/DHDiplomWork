import UIKit

class MoviesCell: UITableViewCell {

    static let moviesID = "moviesID"
    
    let moviesTitleLabel: UILabel = {
        let moviesLabel = UILabel()
        moviesLabel.font = .boldSystemFont(ofSize: 17)
        moviesLabel.lineBreakMode = .byWordWrapping
        moviesLabel.numberOfLines = 0
        moviesLabel.textAlignment = .center
        moviesLabel.translatesAutoresizingMaskIntoConstraints = false
        return moviesLabel
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabelsInView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelsInView() {
        addSubview(moviesTitleLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            moviesTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            moviesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            moviesTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            moviesTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}

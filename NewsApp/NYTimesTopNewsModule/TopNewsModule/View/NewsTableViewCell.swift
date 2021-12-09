import UIKit

class NewsTableViewCell: UITableViewCell {

    static let indentifier = "NewsCell"
    
    let newsTitleLabel: UILabel = {
        let newsLabel = UILabel()
        newsLabel.font = .boldSystemFont(ofSize: 17)
        newsLabel.lineBreakMode = .byWordWrapping
        newsLabel.numberOfLines = 0
        newsLabel.textAlignment = .center
        return newsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabelsInView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelsInView() {
        addSubview(newsTitleLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            newsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            newsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

import UIKit

class ProfileDetailsCell: UITableViewCell {
    
    //MARK: - Variables
    let NameView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "ProfileDetailsCell")
        NameView.translatesAutoresizingMaskIntoConstraints = false
        NameView.numberOfLines = 0
        NameView.textColor = .orange
        addSubview(NameView)
        NSLayoutConstraint.activate([
            NameView.topAnchor.constraint(equalTo:topAnchor, constant: 0),
            NameView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            NameView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            NameView.leftAnchor.constraint(equalTo: leftAnchor, constant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

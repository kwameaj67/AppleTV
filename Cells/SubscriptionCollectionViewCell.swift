//
//  SubscriptionCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class SubscriptionCollectionViewCell: UICollectionViewCell {
    
    
    static let reusableID = "SubscriptionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        infoLabel.attributedText = setAttributedText("tv channels","Experience the world's finest performances in dance, music and stage", "7 days free, then US$1.99/month")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties -
    let movieView : UIView = {
        var iv = UIView()
//        let backgroundImage = UIImageView(image: UIImage(named: "wallpaper")?.withRenderingMode(.alwaysOriginal))
//        backgroundImage.contentMode = .scaleAspectFit
//        iv.backgroundColor = UIColor(patternImage: image!)
//        iv.insertSubview(backgroundImage, at: 0)
        iv.backgroundColor = .black.withAlphaComponent(0.8)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        return sv
    }()
    let buyButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Try It Free", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let infoLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    let exploreLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Explore Channel"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(movieView)
        movieView.addSubview(stackView)
        [infoLabel,buyButton,exploreLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            movieView.topAnchor.constraint(equalTo: topAnchor),
            movieView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: movieView.bottomAnchor,constant: -30),
            stackView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: movieView.trailingAnchor,constant: -30),
            
            
            buyButton.heightAnchor.constraint(equalToConstant: 56),
            buyButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
        ])
    }
    
    func setAttributedText(_ first: String,_ second: String, _ third: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: first, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\n\n\(second)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold),NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\n\n\(third)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]))

        return attributedText
    }
}

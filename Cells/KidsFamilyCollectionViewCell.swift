//
//  KidsFamilyCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class KidsFamilyCollectionViewCell: UICollectionViewCell {
 
    
    static let reusableID = "KidsFamilyCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        movieDetailsLabel.attributedText = setAttributedText("TROLLS WORLD TOUR", "2020 ﹒ Comedy")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:Properties -
    let movieImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .black.withAlphaComponent(0.8)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        return iv
    }()
    let movieNumberLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let movieDetailsLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 8
        return lb
    }()
    let border: UIView = {
        let b = UIView()
        b.backgroundColor = .systemGray5.withAlphaComponent(0.8)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    
    func setupViews(){
        [movieImage,movieNumberLabel,movieDetailsLabel,border].forEach {
            addSubview($0)
        }
    }
    func setup(for item: TopKids){
        movieImage.image = UIImage(named: "\(item.image)")?.withRenderingMode(.alwaysOriginal)
        movieDetailsLabel.attributedText = setAttributedText(item.title, item.details)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 150),
            movieImage.heightAnchor.constraint(equalToConstant: 80),
            
            movieNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieNumberLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 20),
            
            movieDetailsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieDetailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieDetailsLabel.leadingAnchor.constraint(equalTo: movieNumberLabel.trailingAnchor, constant: 20),
            
            border.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 10),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            border.leadingAnchor.constraint(equalTo: movieNumberLabel.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    func setAttributedText(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\n\(subTitle)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]))
        return attributedText
    }
    
}

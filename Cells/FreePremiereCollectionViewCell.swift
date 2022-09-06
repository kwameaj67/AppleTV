//
//  FreePremiereCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class FreePremiereCollectionViewCell: UICollectionViewCell {
    
    
    static let reusableID = "FreePremiereCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:Properties -
    let movieImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .black.withAlphaComponent(0.8)
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        return iv
    }()
    let moveInfoLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.text = "BAD SISTERS ﹒ S1, E1".uppercased()
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let movieTitleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = "The Prick"
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let movieDescLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.text = "A journey of survival begins when an army of Witchfinders attacks the village of Alkenny."
        lb.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    
    func setupViews(){
        [movieImage,moveInfoLabel,movieTitleLabel,movieDescLabel].forEach { item in
            addSubview(item)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 150),
            
            moveInfoLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            moveInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            moveInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moveInfoLabel.bottomAnchor, constant: 10),
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            movieDescLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10),
            movieDescLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieDescLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

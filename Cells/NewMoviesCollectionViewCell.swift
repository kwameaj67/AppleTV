//
//  NewMoviesCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class NewMoviesCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "NewMoviesCell"
    
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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let channelLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "tv channels"
        lb.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(movieImage)
    }
    func setup(for item: NewMovie){
        movieImage.image = UIImage(named: "\(item.image)")?.withRenderingMode(.alwaysOriginal)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}

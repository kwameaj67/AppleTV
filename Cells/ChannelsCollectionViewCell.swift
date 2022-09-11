//
//  ChannelsCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class ChannelsCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "ChannelsCell"
    
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
        iv.layer.cornerRadius = 100/2
        return iv
    }()
    
    func setupViews(){
        addSubview(movieImage)
    }
    func setup(for item: MovieChannel){
        movieImage.image = UIImage(named: "\(item.image)")?.withRenderingMode(.alwaysOriginal)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            movieImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 100),

        ])
    }
    
}

//
//  PopularMoviesCollectionViewCell.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/09/2022.
//

import UIKit


class PopularMoviesCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "PopularMoviesCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties -
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.backgroundColor = .black.withAlphaComponent(0.8)
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let statusLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "Watch it on Apple TV+ now"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(imageView)
        imageView.addSubview(statusLabel)
    }
    func setup(for item: PopularMovie){
        imageView.image = UIImage(named: "\(item.image)")?.withRenderingMode(.alwaysOriginal)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            statusLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -15),
        ])
    }
    
    
}

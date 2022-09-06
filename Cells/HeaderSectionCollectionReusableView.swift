//
//  HeaderSectionCollectionReusableView.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class HeaderSectionCollectionReusableView: UICollectionReusableView {
    
    static let reusableId = "HeaderSectionId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties -
    let headingLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        return lb
    }()
    let headingButton: UIButton = {
        var btn = UIButton()
        btn.setTitleColor(UIColor.link, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        btn.backgroundColor = .none
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        [headingLabel,headingButton].forEach {
            addSubview($0)
        }
        headingLabel.attributedText = setAttributedText("Top Movies", subTitle: "Watch Now")
        
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            headingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            headingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
        
    }
    
    func setAttributedText(_ title: String, subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\n\(subTitle)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        return attributedText
    }
}

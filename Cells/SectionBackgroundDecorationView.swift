//
//  SectionBackgroundDecorationView.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 05/09/2022.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    
    static let reusableId = "SectionBackground"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemGray5.withAlphaComponent(0.3).cgColor]
        
        gradientLayer.shouldRasterize = true
        
        self.layer.addSublayer(gradientLayer)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  UIView+Ext.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/09/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

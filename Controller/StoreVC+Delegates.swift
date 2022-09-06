//
//  StoreVC+Delegates.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/09/2022.
//

import Foundation
import UIKit

extension StoreVC :UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesCollectionViewCell.reusableID, for: indexPath) as! PopularMoviesCollectionViewCell
            return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMoviesCollectionViewCell.reusableID, for: indexPath) as! TopMoviesCollectionViewCell
            cell.movieNumberLabel.text = "\(indexPath.row + 1)"
            cell.border.isHidden = (indexPath.row + 1) % 3 == 0 ? true : false
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewMoviesCollectionViewCell.reusableID, for: indexPath) as! NewMoviesCollectionViewCell
            return cell
        }
        else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KidsFamilyCollectionViewCell.reusableID, for: indexPath) as! KidsFamilyCollectionViewCell
            cell.movieNumberLabel.text = "\(indexPath.row + 1)"
            cell.border.isHidden = (indexPath.row + 1) % 3 == 0 ? true : false
            return cell
        }
        else if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FreePremiereCollectionViewCell.reusableID, for: indexPath) as! FreePremiereCollectionViewCell
            return cell
        }
        else if indexPath.section == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelsCollectionViewCell.reusableID, for: indexPath) as! ChannelsCollectionViewCell
            return cell
        }
        else if indexPath.section == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubscriptionCollectionViewCell.reusableID, for: indexPath) as! SubscriptionCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let itemHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSectionCollectionReusableView.reusableId, for: indexPath) as! HeaderSectionCollectionReusableView
       if indexPath.section == 1 {
            itemHeader.headingLabel.text = "Top Movies Chart"
            itemHeader.headingButton.setTitle("See All", for: .normal)
        }else if indexPath.section == 2 {
            itemHeader.headingLabel.text = "New Movies"
            itemHeader.headingButton.setTitle("See All", for: .normal)
        } else if indexPath.section == 3 {
            itemHeader.headingLabel.text = "Top Kids and Family"
            itemHeader.headingButton.setTitle("See All", for: .normal)
        }else if indexPath.section == 4 {
            itemHeader.headingLabel.attributedText = setAttributedText("Free Apple TV+ Premieres", "Start watching now.")
            itemHeader.headingButton.setTitle("See All", for: .normal)
        }
        else if indexPath.section == 5 {
            itemHeader.headingLabel.attributedText = setAttributedText("Channels", "Choose just the ones you want.")
            itemHeader.headingButton.isHidden = true
        }
        return itemHeader
    }
    
}


//  ViewController.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/09/2022.
//

import UIKit

class StoreVC: UIViewController {
    let cellId = "cellID"

    let topMoviesList = TopMovie.topMoviesData
    let topKidsList = TopKids.topKidsData
    let freePremiereList = FreePremiere.freePremiereData
    let popularMoviesList = PopularMovie.popularMovieData
    let newMoviesList = NewMovie.newMovieData
    let channelList = MovieChannel.channelData
    let subscriptionList = MovieSubscription.subscriptionData
    private var layoutCategory = ["popularMovies","topMovies", "newMovies", "kidsMovies", "freePremiere", "channels", "subscription"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureNavigation()
        setupConstraints()
        collection.delegate = self
        collection.dataSource = self
        collection.register(PopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: PopularMoviesCollectionViewCell.reusableID)
        collection.register(TopMoviesCollectionViewCell.self, forCellWithReuseIdentifier: TopMoviesCollectionViewCell.reusableID)
        collection.register(NewMoviesCollectionViewCell.self, forCellWithReuseIdentifier: NewMoviesCollectionViewCell.reusableID)
        collection.register(KidsFamilyCollectionViewCell.self, forCellWithReuseIdentifier: KidsFamilyCollectionViewCell.reusableID)
        collection.register(FreePremiereCollectionViewCell.self, forCellWithReuseIdentifier: FreePremiereCollectionViewCell.reusableID)
        collection.register(ChannelsCollectionViewCell.self, forCellWithReuseIdentifier: ChannelsCollectionViewCell.reusableID)
        collection.register(SubscriptionCollectionViewCell.self, forCellWithReuseIdentifier: SubscriptionCollectionViewCell.reusableID)
        collection.register(HeaderSectionCollectionReusableView.self, forSupplementaryViewOfKind: HeaderSectionCollectionReusableView.reusableId, withReuseIdentifier: HeaderSectionCollectionReusableView.reusableId)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    let collection: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    func setupViews(){
        view.addSubview(collection)
        setupCompositionalLayout()
    }
    private func setupCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionNum, env in
          
            switch self.layoutCategory[sectionNum]{
            case "popularMovies":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(500)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 15, leading: 5, bottom: 20, trailing: 20)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "topMovies":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let innerRowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [item])
                innerRowGroup.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                let outerColumnGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.89), heightDimension: .absolute(290)), subitems: [innerRowGroup])
                
                let section = NSCollectionLayoutSection(group: outerColumnGroup)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 5, leading: 20, bottom: 0, trailing: 20)
                section.orthogonalScrollingBehavior = .groupPaging
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: HeaderSectionCollectionReusableView.reusableId, alignment: .top)
                ]
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "newMovies":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(190), heightDimension: .absolute(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 5, leading: 20, bottom: 20, trailing: 20)
                section.orthogonalScrollingBehavior = .continuous
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: HeaderSectionCollectionReusableView.reusableId, alignment: .top)
                ]
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "kidsMovies":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let innerRowGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [item])
                innerRowGroup.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                let outerColumnGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.89), heightDimension: .absolute(260)), subitems: [innerRowGroup])
                
                let section = NSCollectionLayoutSection(group: outerColumnGroup)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 10, leading: 20, bottom: 20, trailing: 20)
                section.orthogonalScrollingBehavior = .groupPaging
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), elementKind: HeaderSectionCollectionReusableView.reusableId, alignment: .top)
                ]
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "freePremiere":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(270), heightDimension: .absolute(270)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 15, leading: 20, bottom: 20, trailing: 10)
                section.orthogonalScrollingBehavior = .groupPaging
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: HeaderSectionCollectionReusableView.reusableId, alignment: .top)
                ]
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "channels":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(120)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 15
                section.contentInsets = .init(top: 10, leading: 20, bottom: 0, trailing: 20)
                section.orthogonalScrollingBehavior = .continuous

                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: HeaderSectionCollectionReusableView.reusableId, alignment: .top)
                ]
                let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.reusableId)
                section.decorationItems = [sectionBackground]
                return section
            case "subscription":
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(500)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 0, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(170), heightDimension: .absolute(50)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            }
        }
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: SectionBackgroundDecorationView.reusableId)
        collection.setCollectionViewLayout(layout, animated: true)
    }
   
    func configureNavigation(){
        navigationItem.title = "Store"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupConstraints(){
        collection.pin(to: view)
    }
    func setAttributedText(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),NSAttributedString.Key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\n\(subTitle)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7)]))
        return attributedText
    }
}




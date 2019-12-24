//
//  AppsController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 29/10/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class AppsPageController: BaseCollectionController {
    
    let activity: UIActivityIndicatorView = {
        let acv = UIActivityIndicatorView(status: false)
        acv.hidesWhenStopped = true
        acv.color = .black
        acv.startAnimating()
        return acv
    }()
    
    fileprivate let cellId = "id"
    fileprivate let headerId = "headerId"
    fileprivate var groups = [AppsResult]()
    var headerData: [HeaderData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(activity)
        fetchData()
        setupActivityIndicatorConstraint()
    }
    
    func setupActivityIndicatorConstraint() {
        NSLayoutConstraint.activate([
            activity.topAnchor.constraint(equalTo: view.topAnchor),
            activity.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activity.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activity.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    fileprivate func fetchData() {
        
        var group1: AppsResult?
        var group2: AppsResult?
        var group3: AppsResult?
        var group4: [HeaderData]?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (apps, err) in
            guard let appsResult = apps else { return }
            group1 = appsResult
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        Service.shared.fetchAppGroups(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") { (apps, err) in
            guard let appsResult = apps else { return }
            group2 = appsResult
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        Service.shared.fetchAppGroups(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json") { (apps, err) in
            guard let appsResult = apps else { return }
            group3 = appsResult
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        Service.shared.fetchHeaderData { (apps, err) in
            guard let appResult = apps else { return }
            group4 = appResult
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            if let groupHeader = group4 {
                self.headerData = groupHeader
            }
            self.activity.stopAnimating()
            self.collectionView.reloadData()
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.controller.headerData = self.headerData
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let appsGroup = groups[indexPath.item]
        cell.titleSectionLabel.text = appsGroup.feed.title
        cell.horizontalController.appsGroup = appsGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    
}

extension AppsPageController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
}

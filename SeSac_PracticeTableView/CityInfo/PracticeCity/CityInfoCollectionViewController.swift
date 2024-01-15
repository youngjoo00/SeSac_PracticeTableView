//
//  CityInfoCollectionViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/9/24.
//

import UIKit

class CityInfoCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        let cellhegiht = UIScreen.main.bounds.height - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellhegiht / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityInfo.city.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfoCollectionViewCell", for: indexPath) as! CityInfoCollectionViewCell
        
        let row = CityInfo.city[indexPath.row]
        
        let url = URL(string: "\(row.city_image)")
        cell.cityImageView.kf.setImage(with: url)

        cell.koreaNameLabel.text = row.city_name

        cell.englishNameLabel.text = row.city_english_name

        cell.descriptionLabel.text = row.city_explain

        return cell
    }
}

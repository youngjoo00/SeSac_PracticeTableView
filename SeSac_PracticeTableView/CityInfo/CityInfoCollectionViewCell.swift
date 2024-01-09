//
//  CityInfoCollectionViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/9/24.
//

import UIKit

class CityInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var koreaNameLabel: UILabel!
    @IBOutlet var englishNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pipeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = cityImageView.bounds.height/2
        
        pipeView.backgroundColor = .black
        
        koreaNameLabel.font = .boldSystemFont(ofSize: 20)
        
        englishNameLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
}

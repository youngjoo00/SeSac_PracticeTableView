//
//  City_Step2_CollectionViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/9/24.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var koreaNameLabel: UILabel!
    @IBOutlet var pipeView: UIView!
    @IBOutlet var englishNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cityBottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        pipeView.backgroundColor = .black
        
        koreaNameLabel.font = .boldSystemFont(ofSize: 20)
        koreaNameLabel.textAlignment = .right
        cityImageView.contentMode = .scaleAspectFill
        englishNameLabel.font = .boldSystemFont(ofSize: 20)
        
        // 여기서 처음에 한번에 원형으로 만들어주면 되는거 아닐까?
        DispatchQueue.main.async {
            self.cityImageView.layer.cornerRadius = self.cityImageView.frame.width / 2
            self.cityImageView.clipsToBounds = true
        }
        
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }

}

//
//  DetailCityInfoTableViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/11/24.
//

import UIKit

class DetailCityInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeBtns: UIStackView!
    @IBOutlet var saveCountLabel: UILabel!
    @IBOutlet var DetailCityImageView: UIImageView!
    @IBOutlet var likeBtn: UIButton!
    
    static let identifier = "DetailCityInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
}

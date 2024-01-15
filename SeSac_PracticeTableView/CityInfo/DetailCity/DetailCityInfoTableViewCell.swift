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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDesignCell()
    }
    
    func setDesignCell() {
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .boldSystemFont(ofSize: 16)
        
        saveCountLabel.textColor = .lightGray
        saveCountLabel.font = .systemFont(ofSize: 15)
        DetailCityImageView.contentMode = .scaleAspectFill
        
        likeBtn.tintColor = .white
        
        selectionStyle = .none
        
    }
    
    func setDataCell(data: Travel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        // numberFormatter 사용
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let formattedSaveNumber = numberFormatter.string(for: data.save)
        
        let randomNumber = Int.random(in: 0...3000)
        let formattedRandomNumber = numberFormatter.string(for: randomNumber)
        saveCountLabel.text = "(\(formattedRandomNumber!)) · 저장 \(formattedSaveNumber!)"
        
        let url = URL(string: "\(data.travel_image!)")
        DetailCityImageView.kf.setImage(with: url)
    }
}

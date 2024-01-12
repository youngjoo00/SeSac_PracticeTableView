//
//  AdvertiseTableViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/11/24.
//

import UIKit

class AdvertiseTableViewCell: UITableViewCell {
    
    static let identifier = "AdvertiseTableViewCell"
    
    @IBOutlet var advertiseTitleLabel: UILabel!
    @IBOutlet var advertiseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDesignCell()
        
    }
    
    func setDesignCell() {
        
        selectionStyle = .none
        layer.cornerRadius = 12
        
        advertiseTitleLabel.numberOfLines = 0
        advertiseTitleLabel.font = .boldSystemFont(ofSize: 20)
        advertiseTitleLabel.textAlignment = .center
        
        advertiseLabel.text = "AD"
        advertiseLabel.backgroundColor = .white
        advertiseLabel.layer.cornerRadius = 8
        advertiseLabel.clipsToBounds = true
        advertiseLabel.textAlignment = .center
        advertiseLabel.font = .boldSystemFont(ofSize: 15)
        
        // 처음에 보이는 셀의 백그라운드 컬러만 랜덤으로 지정이 되고, 그 뒤로 나오는 재사용되는 셀들에 그 색깔들이 입혀진다.
        // 그건 또 아닌데?
        
        backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
    }
    
    func setDataCell(data: Travel) {
        advertiseTitleLabel.text = data.title
    }
    
}

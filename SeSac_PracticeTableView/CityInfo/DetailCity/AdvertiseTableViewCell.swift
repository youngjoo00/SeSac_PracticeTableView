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
        selectionStyle = .none
        layer.cornerRadius = 12
    }
    
}

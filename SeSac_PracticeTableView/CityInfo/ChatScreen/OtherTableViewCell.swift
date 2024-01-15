//
//  OtherTableViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/15/24.
//

import UIKit

class OtherTableViewCell: UITableViewCell {
    
    @IBOutlet var otherImageView: UIImageView!
    @IBOutlet var otherNameLabel: UILabel!
    @IBOutlet var otherChatLabel: UILabel!
    @IBOutlet var otherTimeLabel: UILabel!
    @IBOutlet var otherChatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designCell()
    }

    func setOtherCell(_ data: Chat) {
        otherImageView.image = UIImage(named: data.user.profileImage)
        otherNameLabel.text = data.user.rawValue
        otherChatLabel.text = data.message
        otherTimeLabel.text = data.formattedTime
    }
    
    func designCell() {
        self.otherImageView.contentMode = .scaleAspectFill
        self.otherImageView.clipsToBounds = true
        
        DispatchQueue.main.async {
            self.otherImageView.layer.cornerRadius = self.otherImageView.frame.width / 2
        }
        
        otherNameLabel.font = .boldSystemFont(ofSize: 16)
        otherChatLabel.font = .systemFont(ofSize: 15)
        otherChatLabel.textColor = .black
        
        otherChatView.layer.borderWidth = 1
        otherChatView.layer.cornerRadius = 8
        otherChatView.layer.borderColor = UIColor.darkGray.cgColor
        
        selectionStyle = .none
        
        otherTimeLabel.font = .systemFont(ofSize: 13)
        otherTimeLabel.textColor = .lightGray
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
    
}

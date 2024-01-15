//
//  MyselfTableViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/15/24.
//

import UIKit

class MyselfTableViewCell: UITableViewCell {
    
    @IBOutlet var myselfChatLabel: UILabel!
    @IBOutlet var myselfTimeLabel: UILabel!
    @IBOutlet var myselfChatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designCell()
    }

    func setMyselfCell(_ data: Chat) {
        myselfChatLabel.text = data.message
        myselfTimeLabel.text = data.formattedTime
    }
    
    func designCell() {
        
        myselfChatLabel.font = .systemFont(ofSize: 15)
        myselfChatLabel.textColor = .black
        
        myselfChatView.layer.borderWidth = 1
        myselfChatView.layer.cornerRadius = 8
        myselfChatView.layer.borderColor = UIColor.darkGray.cgColor
        myselfChatView.backgroundColor = .systemGray5
        selectionStyle = .none
        
        myselfTimeLabel.font = .systemFont(ofSize: 13)
        myselfTimeLabel.textColor = .lightGray
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
    
}

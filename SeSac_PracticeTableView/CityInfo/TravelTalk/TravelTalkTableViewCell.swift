//
//  TravelTalkTableViewCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/14/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {

    static let identifier = "TravelTalkTableViewCell"
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var talkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    lazy var image = userImageView
    override func awakeFromNib() {
        super.awakeFromNib()

        designCell()
    }

    func setTravelTalkCell(_ data: ChatRoom) {
        userImageView.image = UIImage(named: data.chatroomImage[0])
        nicknameLabel.text = data.chatroomName
        talkLabel.text = data.chatList.last?.message ?? ""
        dateLabel.text = data.chatList.last?.formattedDate
    }
    
    func designCell() {
        // 아.. 이미지 중앙에 이쁘게 넣고싶다..
        self.userImageView.contentMode = .scaleAspectFill
        self.userImageView.clipsToBounds = true
        DispatchQueue.main.async {
            self.userImageView.contentMode = .scaleAspectFill
            self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
        }
        
        nicknameLabel.font = .boldSystemFont(ofSize: 18)
        talkLabel.font = .systemFont(ofSize: 15)
        talkLabel.textColor = .darkGray
        selectionStyle = .none
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
}

//
//  ChatScreenViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/15/24.
//

import UIKit

class ChatScreenViewController: UIViewController {

    @IBOutlet var chatScreenTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    @IBOutlet var chatBtn: UIButton!
    
    var chatData: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [], chatroomName: "", chatList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureUI()
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc func leftBarButtonItemClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension ChatScreenViewController: viewProtocol {
    func configureNaviTitle(navigationItemTitle naviTitle: String) {
        navigationItem.title = naviTitle
    }
    
    
}

extension ChatScreenViewController {

    func configureUI() {
        configureNaviTitle(navigationItemTitle: chatData.chatroomName)
        chatTextField.placeholder = "메세지를 입력하세요"
        chatBtn.tintColor = .lightGray
        chatBtn.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        
        let image = UIImage(systemName: "lessthan")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        
        navigationItem.leftBarButtonItem = button
        self.navigationController?.navigationBar.tintColor = .black

    }
    
    func configureTableView() {
        
        chatScreenTableView.delegate = self
        chatScreenTableView.dataSource = self
        
        let otherXib = UINib(nibName: OtherTableViewCell.identifier, bundle: nil)
        chatScreenTableView.register(otherXib, forCellReuseIdentifier: OtherTableViewCell.identifier)
        
        let myselfXib = UINib(nibName: MyselfTableViewCell.identifier, bundle: nil)
        chatScreenTableView.register(myselfXib, forCellReuseIdentifier: MyselfTableViewCell.identifier)
    }
    
    
}
extension ChatScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = chatData.chatList[indexPath.row]
        
        if row.user.rawValue == "user" {
            let cell = chatScreenTableView.dequeueReusableCell(withIdentifier: MyselfTableViewCell.identifier, for: indexPath) as! MyselfTableViewCell
            
            cell.setMyselfCell(row)
            
            return cell
        } else {
            let cell = chatScreenTableView.dequeueReusableCell(withIdentifier: OtherTableViewCell.identifier, for: indexPath) as! OtherTableViewCell
            
            cell.setOtherCell(row)
            return cell
        }
    }
    
}

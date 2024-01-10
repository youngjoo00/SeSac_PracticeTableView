//
//  SettingsTableViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/5/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let allSettings = ["공지사항", "실험실", "버전 정보"]
    let personalSettings = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let other = ["고객센터/도움말"]
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        headerView.backgroundColor = .black
        headerLabel.text = "설정"
        headerLabel.textColor = .white
    }
}


extension SettingsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return allSettings.count
        } else if section == 1 {
            return personalSettings.count
        } else {
            return other.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell")!
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = allSettings[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = personalSettings[indexPath.row]
        } else {
            cell.textLabel?.text = other[indexPath.row]
        }
        
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else {
            return "기타"
        }
    }

}

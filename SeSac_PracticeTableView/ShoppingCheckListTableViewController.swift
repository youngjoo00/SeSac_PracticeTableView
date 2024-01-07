//
//  ShoppingCheckListTableViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/5/24.
//

import UIKit

class ShoppingCheckListTableViewController: UITableViewController {

    var checkList = ["할 일들을 추가해보세요!", "이거저거 구매하기,,"]
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var addListTextField: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = "쇼핑"
        headerLabel.font = .boldSystemFont(ofSize: 20)
        
        addListTextField.placeholder = "무엇을 구매하실건가요?"
        addListTextField.backgroundColor = .systemGray6
        
        addBtn.setTitle("추가", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.backgroundColor = .systemGray4
        addBtn.layer.cornerRadius = 8
    }
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        checkList.append(addListTextField.text!)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCell", for: indexPath) as! ShoppingCheckListTableViewCell
        
        cell.checkBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.favoritesBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        cell.favoritesBtn.tintColor = .black
        
        cell.titleLabel.text = checkList[indexPath.row]

        cell.checkListView.backgroundColor = .systemGray6
        cell.checkListView.layer.cornerRadius = 8
        cell.checkListView.tintColor = .black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            checkList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

//
//  ShoppingCheckListTableViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/5/24.
//

import UIKit

struct Todo {
    var list: String
    var checkbox: Bool
    var favorites: Bool
}

class ShoppingCheckListTableViewController: UITableViewController {

    var todoList: [Todo] = [Todo(list: "할 일을 입력해보세요.", checkbox: false, favorites: false),
                            Todo(list: "할 일이 없으신가요??", checkbox: false, favorites: false),
                            Todo(list: "없으면 안돼요,,", checkbox: false, favorites: false),
                            Todo(list: "열심히 살아봅시다,,", checkbox: false, favorites: false),
    ]
    
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
        todoList.append(Todo(list: addListTextField.text!, checkbox: false, favorites: false))
        tableView.reloadData()
    }
    
    @objc func checkboxBtnClicked(sender: UIButton) {
        todoList[sender.tag].checkbox.toggle()
        tableView.reloadData()
    }
    
    @objc func favoritesBtnClicked(sender: UIButton) {
        todoList[sender.tag].favorites.toggle()
        tableView.reloadData()
    }
    
}


extension ShoppingCheckListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCell", for: indexPath) as! ShoppingCheckListTableViewCell
        
        let checkImage = todoList[indexPath.row].checkbox ? "checkmark.square.fill" : "checkmark.square"
        let starImage = todoList[indexPath.row].favorites ? "star.fill" : "star"
        
        cell.checkBtn.setImage(UIImage(systemName: checkImage), for: .normal)
        cell.favoritesBtn.setImage(UIImage(systemName: starImage), for: .normal)
        cell.favoritesBtn.tintColor = .black
        
        cell.titleLabel.text = todoList[indexPath.row].list

        cell.checkListView.backgroundColor = .systemGray6
        cell.checkListView.layer.cornerRadius = 8
        cell.checkListView.tintColor = .black
        
        cell.checkBtn.tag = indexPath.row
        cell.favoritesBtn.tag = indexPath.row
        cell.checkBtn.addTarget(self, action: #selector(checkboxBtnClicked), for: .touchUpInside)
        cell.favoritesBtn.addTarget(self, action: #selector(favoritesBtnClicked), for: .touchUpInside)
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
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

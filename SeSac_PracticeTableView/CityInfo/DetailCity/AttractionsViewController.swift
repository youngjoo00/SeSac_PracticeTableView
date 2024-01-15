//
//  AttractionsViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/11/24.
//

import UIKit

class AttractionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNaviItemView()
        configureNaviTitle(navigationItemTitle: "관광지 화면")
    }
    
    @objc func leftBarButtonItemClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension AttractionsViewController {
    func configureNaviItemView() {
        // 1. UIBarButtonItem 을 만든다.
        // 2. 누르면 실행될 함수를 만든다.
        // 3. navigationItem 에 장착한다.
        
        let image = UIImage(systemName: "lessthan")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        
        navigationItem.leftBarButtonItem = button
        self.navigationController?.navigationBar.tintColor = .black

    }
}
extension AttractionsViewController: NaviTitleProtocol {
    func configureNaviTitle(navigationItemTitle naviTitle: String) {
        navigationItem.title = naviTitle
    }
    
    
}

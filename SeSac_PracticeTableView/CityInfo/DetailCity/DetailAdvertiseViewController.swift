//
//  DetailAdvertiseViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/11/24.
//

import UIKit

class DetailAdvertiseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNaviTitle(navigationItemTitle: "광고 화면")
        
        configureNaviItemView()
    }

    @objc func leftBarButtonItemClicked() {
        dismiss(animated: true)
    }
}

extension DetailAdvertiseViewController {
    func configureNaviItemView() {
        // 1. UIBarButtonItem 을 만든다.
        // 2. 누르면 실행될 함수를 만든다.
        // 3. navigationItem 에 장착한다.
        
        let image = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        
        navigationItem.leftBarButtonItem = button
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}
extension DetailAdvertiseViewController: viewProtocol {
    func configureNaviTitle(navigationItemTitle naviTitle: String) {
        navigationItem.title = naviTitle
    }
    
    
}

//
//  MagazineWebViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/15/24.
//

import UIKit
import WebKit

class MagazineWebViewController: UIViewController {

    @IBOutlet var magazineWebView: WKWebView!
    
    var data: Magazine = Magazine(title: "", subtitle: "", photo_image: "", date: "", link: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNaviTitle(navigationItemTitle: data.title)
        if let url = URL(string: data.link) {
            let request = URLRequest(url: url)
            magazineWebView.load(request)
        }
    }

}

extension MagazineWebViewController: NaviTitleProtocol {
    func configureNaviTitle(navigationItemTitle naviTitle: String) {
        navigationItem.title = naviTitle
    }
    
    
}

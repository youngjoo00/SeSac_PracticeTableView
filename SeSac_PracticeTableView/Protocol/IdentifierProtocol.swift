//
//  IdentifierProtocol.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/15/24.
//

import UIKit

protocol IdentifierProtocol {
    static var identifier: String { get }
}

extension UIViewController: IdentifierProtocol {
    static var identifier: String {
        // 자신의 클래스명을 String 으로 바꿔서 identifier 로 등록
        return String(describing: self)
    }
    
}

extension UITableViewCell: IdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

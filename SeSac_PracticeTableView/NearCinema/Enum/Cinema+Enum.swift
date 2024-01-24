//
//  Cinema+Enum.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/24/24.
//

import UIKit
import MapKit

enum CinemaEnum: Int, CaseIterable {
    case megabox
    case lotteCinema
    case CGV
    case all
    
    var cinemaName: String {
        switch self {
        case .megabox:
            return "메가박스"
        case .lotteCinema:
            return "롯데시네마"
        case .CGV:
            return "CGV"
        case .all:
            return "전체보기"
        }
    }
    
}

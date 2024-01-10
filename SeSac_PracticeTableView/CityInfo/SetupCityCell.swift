//
//  SetupCityCell.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/10/24.
//

// 콜렉션 뷰를 만들때 필수적으로 무엇이 필요한가?
protocol SetupCityCell {
    var city: [City] { get }
    var identifier: String { get }
    func configureCell()
}

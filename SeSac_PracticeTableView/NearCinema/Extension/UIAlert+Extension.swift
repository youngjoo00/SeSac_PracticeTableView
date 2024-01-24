//
//  UIAlert+Extension.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/24/24.
//

import UIKit
import MapKit

extension UIViewController {
    
    func showLocationSettingAlert(title: String, message: String, btnTitle: String, complectionHandler: @escaping () -> Void, cancelHandler: @escaping (CLLocationCoordinate2D) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: btnTitle, style: .default) { _ in
            complectionHandler()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            let coordinate = CLLocationCoordinate2D(latitude: 37.65450884661877, longitude: 127.0499246829453)
            cancelHandler(coordinate)
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func showCinemaAlert(complectionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancel)
        
        for item in CinemaEnum.allCases {
            let alertBtn = UIAlertAction(title: item.cinemaName, style: .default) { _ in
                complectionHandler(item.cinemaName)
            }
            
            alert.addAction(alertBtn)
        }

        present(alert, animated: true)
    }
}

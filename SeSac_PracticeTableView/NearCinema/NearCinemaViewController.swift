//
//  NearCinemaViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/16/24.
//

import UIKit
import MapKit

// 열거형을 이용한 코드 리팩토링
// segmentTitle 값을 이용하면 스위치는 필요없지 않을까?

class NearCinemaViewController: UIViewController {
    
    @IBOutlet var cinemaMapView: MKMapView!
    @IBOutlet var cinemaSegmentControl: UISegmentedControl!
    
    let originalCinemaList = NearCinema.mapAnnotations
    var annotations: [MKAnnotation] = []
    var segmentCinemaList = NearCinema.mapAnnotations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapView()
        cinemaMapView.delegate = self
        setSegmentControl()
    }
    
    @IBAction func changedSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: 
            segmentCinemaList = originalCinemaList
        case 1:
            segmentCinemaList = NearCinema.mapAnnotations.filter { $0.type == "메가박스"}
        case 2:
            segmentCinemaList = NearCinema.mapAnnotations.filter { $0.type == "롯데시네마"}
        case 3:
            segmentCinemaList = NearCinema.mapAnnotations.filter { $0.type == "CGV"}
        default:
            break
        }
    }
    
}

extension NearCinemaViewController {
    
    func setSegmentControl() {
        cinemaSegmentControl.setTitle("전체보기", forSegmentAt: 0)
        cinemaSegmentControl.setTitle("메가박스", forSegmentAt: 1)
        cinemaSegmentControl.insertSegment(withTitle: "롯데시네마", at: 2, animated: true)
        cinemaSegmentControl.insertSegment(withTitle: "CGV", at: 3, animated: true)
    }
}

extension NearCinemaViewController: MKMapViewDelegate {
    
    func setMapView() {
        // 어노테이션즈라는 프로퍼티 배열에 있는 모든 값을 지운다.
        annotations.removeAll()
        
        // cinema맵 뷰에 있는 어노테이션을 모두 지운다.
        cinemaMapView.removeAnnotations(cinemaMapView.annotations)
        
        for cinema in segmentCinemaList {
            // 위경도 잡기
            let coordinate = CLLocationCoordinate2D(latitude: cinema.latitude, longitude: cinema.longitude)
            
            // 화면에 보여질 중심 잡기
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
            cinemaMapView.setRegion(region, animated: true)
            
            // 포인트 찍기
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = cinema.location
            annotations.append(annotation)
        }
        
        cinemaMapView.addAnnotations(annotations)
    }
    

}


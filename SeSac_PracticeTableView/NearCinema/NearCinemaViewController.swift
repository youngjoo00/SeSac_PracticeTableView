//
//  NearCinemaViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/16/24.
//

import UIKit
import MapKit

class NearCinemaViewController: UIViewController {
    
    @IBOutlet var cinemaMapView: MKMapView!
    @IBOutlet var cinemaSegmentControl: UISegmentedControl!
    
    let cinemaList = NearCinema.mapAnnotations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapView()
        cinemaMapView.delegate = self
        setSegmentControl()
    }
    
}

extension NearCinemaViewController {
    
    func setSegmentControl() {
        cinemaSegmentControl.setTitle("메가박스", forSegmentAt: 0)
        cinemaSegmentControl.setTitle("롯데시네마", forSegmentAt: 1)
        cinemaSegmentControl.insertSegment(withTitle: "CGV", at: 2, animated: true)
        cinemaSegmentControl.insertSegment(withTitle: "전체보기", at: 3, animated: true)
    }
}

extension NearCinemaViewController: MKMapViewDelegate {
    
    func setMapView() {
        for cinema in cinemaList {
            let coordinate = CLLocationCoordinate2D(latitude: cinema.latitude, longitude: cinema.longitude)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            cinemaMapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = cinema.location
            cinemaMapView.addAnnotation(annotation)
        }
    }

}


//
//  NearCinemaSecondViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/24/24.
//

import UIKit
import MapKit
import CoreLocation

class NearCinemaSecondViewController: UIViewController {

    @IBOutlet var locationBtn: UIButton!
    @IBOutlet var filterBtn: UIButton!
    @IBOutlet var cinemaMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var locationAnnotation: MKAnnotation?
    var cinemaAnnotations: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        locationBtn.addTarget(self, action: #selector(didLocationBtnTapped), for: .touchUpInside)
        filterBtn.addTarget(self, action: #selector(didFilterBtnTapped), for: .touchUpInside)
        setMapView(title: "전체보기")
    }
   
    @objc func didLocationBtnTapped() {
        // 버튼을 누를때 delegate 를 연결
        locationManager.delegate = self
        checkDeviceLocationAuthorization()
    }
    
    @objc func didFilterBtnTapped() {
        showCinemaAlert { title in
            self.setMapView(title: title)
        }
    }
    
}

extension NearCinemaSecondViewController {
    
    // 앞으로 고정된 UI 는 이렇게 extension 으로 관리하는게 좋아보인다.
    func configureUI() {
        locationBtn.configuration = .cinemaBtn(title: "위치 권한 설정", baseForegroundColor: .systemGray5, baseBackgroundColor: .systemIndigo)
        
        filterBtn.configuration = .cinemaBtn(title: "영화관 필터링", baseForegroundColor: .systemCyan, baseBackgroundColor: .systemFill)
    }
    
    func setMapView(title: String) {
        
        cinemaAnnotations.removeAll()
        cinemaMapView.removeAnnotations(cinemaMapView.annotations)
        
        for cinema in Cinema.mapAnnotations {

            if cinema.type == title || title == "전체보기" {
                let coordinate = CLLocationCoordinate2D(latitude: cinema.latitude, longitude: cinema.longitude)
                
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
                cinemaMapView.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = cinema.location
                cinemaAnnotations.append(annotation)
            }
        }
        cinemaMapView.addAnnotations(cinemaAnnotations)
    }
    
    // 1. 기기 설정 확인
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    // 2. 앱 설정 확인
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                DispatchQueue.main.async {
                    self.showLocationSettingAlert(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호' 에서 위치 서비스를 켜주세요", btnTitle: "설정으로 이동") {
                        self.showLocationSetting()
                    } cancelHandler: { coordinate in
                        self.setRegionAndAnnotation(center: coordinate, annotationTitle: "청년취업사관학교 도봉 캠퍼스")
                    }
                }
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            showLocationSettingAlert(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호' 에서 위치 서비스를 켜주세요", btnTitle: "설정으로 이동") {
                self.showLocationSetting()
            } cancelHandler: { coordinate in
                self.setRegionAndAnnotation(center: coordinate, annotationTitle: "청년취업사관학교 도봉 캠퍼스")
            }
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print("Error")
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D, annotationTitle: String) {
        
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        
        // 맵뷰에 얻어온 region 값 띄우기
        cinemaMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = annotationTitle
        self.locationAnnotation = annotation
        cinemaMapView.addAnnotation(locationAnnotation!)
    }
    
    func showLocationSetting() {
        if let setting = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(setting)
        } else {
            print("네이버지도도 취소누르면 아무일도 안하네요,,")
        }
    }
}

extension NearCinemaSecondViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate, annotationTitle: "현재 위치")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    
    // 권한 바뀌면 처음부터 전부 체크
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
}

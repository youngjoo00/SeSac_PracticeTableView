//
//  City_Step3_ViewController.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/9/24.
//

import UIKit

class City_Step3_ViewController: UIViewController {
    
    @IBOutlet var travelOptionSegment: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var headerLineView: UIView!
    @IBOutlet var travelSearchBar: UISearchBar!
    
    // 타입 프로퍼티
    let originalTravelList = CityInfo.city
    var segmentTravelList = CityInfo.city {
        didSet {
            filterTravelList = segmentTravelList
        }
    }
    var filterTravelList = CityInfo.city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        configureCell()
    }

    @IBAction func travelOptionChanged(_ sender: UISegmentedControl) {
        
        // 여기도 열거형으로 바꿀 수 있을듯
        switch sender.selectedSegmentIndex {
        case 0:
            segmentTravelList = CityInfo.city
        case 1:
            segmentTravelList = CityInfo.city.filter { $0.domestic_travel }
        case 2:
            segmentTravelList = CityInfo.city.filter { !$0.domestic_travel }
        default:
            break
        }
    }
    
}

// SetupUI
extension City_Step3_ViewController {
    
    func setUI() {
        navigationItem.title = "인기 도시"
        headerLineView.backgroundColor = .systemGray5
        travelOptionSegment.setTitle("모두", forSegmentAt: 0)
        travelOptionSegment.setTitle("국내", forSegmentAt: 1)
        travelOptionSegment.insertSegment(withTitle: "해외", at: 2, animated: true)
        travelSearchBar.searchBarStyle = .minimal
        travelSearchBar.placeholder = "여행지를 검색해보세요"
        travelSearchBar.delegate = self
        travelSearchBar.showsCancelButton = true
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
    }
}

extension City_Step3_ViewController: SetupCityCell {
    
    func configureCell() {
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 12
        
        // 디바이스 기준으로 가로 길이를 잡아놓고,
        // 가로 길이에 맞춰서 세로길이를 맞추면 셀이 1:1 비율로 나올수밖에 없음 -> 즉, 이미지만 1:1 비율로 나오는거임
        // 그러니까 가로길이에 * 1.2 ~ 1.5 배로 준다면 1:1.5 이런 형식의 가로세로 비율의 셀이 나와서 이쁘게 레이아웃이 잡힘
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        let cellhieght = ((UIScreen.main.bounds.width - (spacing * 3)) * 1.5) / 2
        
        layout.itemSize = CGSize(width: cellWidth, height: cellhieght)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        cityCollectionView.collectionViewLayout = layout
    }
    
}

extension City_Step3_ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return filterTravelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        
        let row = filterTravelList[indexPath.row]
        
        let url = URL(string: "\(row.city_image)")
        cell.cityImageView.kf.setImage(with: url)
        
//        let travelSearchBarText = travelSearchBar.text!.uppercased().components(separatedBy: " ").joined()
        
        cell.koreaNameLabel.text = row.city_name
        
        cell.englishNameLabel.text = row.city_english_name

        cell.descriptionLabel.text = row.city_explain
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let detailCityInfoVC = storyboard?.instantiateViewController(withIdentifier: DetailCityInfoViewController.identifier) as! DetailCityInfoViewController
        
        navigationController?.pushViewController(detailCityInfoVC, animated: true)
        
    }
}

extension City_Step3_ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var filterList: [City] = []
        // 공백 및 대소문자 상관없이 서치 가능
        let travelSearchBarText = travelSearchBar.text!.uppercased().components(separatedBy: " ").joined()
        // segment 컨트롤러에 해당하는 값 중 검색 결과 나타내기 city
        if travelSearchBarText == "" {
            filterTravelList = segmentTravelList
        } else {
            for item in segmentTravelList {
                if item.city_name.uppercased().contains(travelSearchBarText) || item.city_english_name.uppercased().contains(travelSearchBarText) || item.city_explain.uppercased().contains(travelSearchBarText) {
                    filterList.append(item)
                }
            }
            filterTravelList = filterList
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var filterList: [City] = []
        let travelSearchBarText = travelSearchBar.text!.uppercased().components(separatedBy: " ").joined()
        
        // segment 컨트롤러에 해당하는 값 중 검색 결과 나타내기 city
        if travelSearchBarText == "" {
            filterTravelList = segmentTravelList
        } else {
            for item in segmentTravelList {
                if item.city_name.contains(travelSearchBarText) || item.city_english_name.contains(travelSearchBarText) || item.city_explain.contains(travelSearchBarText) {
                    filterList.append(item)
                }
            }
            filterTravelList = filterList
        }
        print(filterList)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        travelSearchBar.text = ""
        filterTravelList = segmentTravelList
    }
    
}

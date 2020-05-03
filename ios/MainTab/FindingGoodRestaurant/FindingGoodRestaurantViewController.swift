//
//  findingGoodRestaurantViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreLocation

class FindingGoodRestaurantViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {
    
    unowned var dataManager: EventMainDataManager {
        get {
            return EventMainDataManager()
        }
    }
    private var restaurants: [UIImage] {
        var restaurants:[UIImage] = []
        for i in 0...50 {
            //배열 길이 50 임의 지정
            let index = i % 4
            //이미지 16개 임의 지정
            let image = UIImage(named: "restaurants\(index)")!
            //이미지 api로 받아서 넣어야됨 일단 이미지 넣는 방식이 이렇다는거
            restaurants.append(image)
        }
        return restaurants
    }
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        
        let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.8 , height: halfWidth * 0.9)
        self.collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
//        self.collectionView.isScrollEnabled = false
//        self.collectionView.isPagingEnabled = false //스크롤 안되게
        
    }
  
    var pageViewController : UIPageViewController!
        var pageTitles: NSArray!
        var pageImages: NSArray!
        var scrollView: UIScrollView!
        var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.black]
//        var images:[UIImage] = []
    
        
        var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        var pageControl: UIPageControl!
        var headerVisible = true

        var locationManager:CLLocationManager!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
        @IBOutlet weak var pagecontrolContainer: UIView!
        @IBOutlet weak var pagerContainer: UIView!
       
        @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var alignButton: UIButton!
    
    @IBAction func presentLocationList(_ sender: UIButton) {
        
        let locationPopUpStoryboard = UIStoryboard(name: "LocationPopUp", bundle: Bundle.main)
                guard let locationPopUp = locationPopUpStoryboard.instantiateViewController(withIdentifier: "LocationPopUp") as? LocationPopUp else {
                    return
                }
                locationPopUp.locationPopUpDelegate = self
                locationPopUp.modalPresentationStyle = .custom
                // 기본 팝업 세팅 끝

                self.present(locationPopUp, animated: true, completion: nil)
        
//        let locationPopUpvc = LocationPopUpViewController() //change this to your class name
//        locationPopUpvc.modalPresentationStyle = .custom
//        self.present(locationPopUpvc, animated: true, completion: nil)
        
//
//        let locationPopUpStoryboard = UIStoryboard(name: "LocationPopUp", bundle: Bundle.main)
//                       guard let locationPopUp = locationPopUpStoryboard
//                           .instantiateViewController(withIdentifier: "LocationPopUp") as? LocationPopUp else {
//                           return
//                       }
//                       locationPopUp.locationPopUpDelegate = self
//                       locationPopUp.modalPresentationStyle = .custom
//                       // 기본 팝업 세팅 끝
//
//                       self.present(locationPopUp, animated: true, completion: nil)
        
        
//        let noticePopUpStoryboard = UIStoryboard(name: "NoticePopUp", bundle: Bundle.main)
//                guard let noticePopUp = noticePopUpStoryboard
//                    .instantiateViewController(withIdentifier: "NoticePopUp") as? NoticePopUp else {
//                    return
//                }
//                noticePopUp.noticePopUpDelegate = self
//                noticePopUp.modalPresentationStyle = .custom
//                // 기본 팝업 세팅 끝
//
//                self.present(noticePopUp, animated: true, completion: nil)
        
    }
    
    @IBAction func presentSearchView(_ sender: UIButton) {
        let searchvc = SearchViewController() //change this to your class name
                searchvc.modalPresentationStyle = .fullScreen
                self.present(searchvc, animated: true, completion: nil)
               
        
    }
    
    
    
    @IBAction func presentAlign(_ sender: UIButton) {
        let alignPopUpStoryboard = UIStoryboard(name: "AlignPopUp", bundle: Bundle.main)
                guard let alignPopUp = alignPopUpStoryboard
                    .instantiateViewController(withIdentifier: "AlignPopUp") as? AlignPopUp else {
                    return
                }
                alignPopUp.alignPopUpDelegate = self
                alignPopUp.modalPresentationStyle = .custom
                // 기본 팝업 세팅 끝
        
                self.present(alignPopUp, animated: true, completion: nil)
    }
    
    
    @IBAction func presentRadius(_ sender: UIButton) {
        let radiusPopUpStoryboard = UIStoryboard(name: "RadiusPopUp", bundle: Bundle.main)
                guard let radiusPopUp = radiusPopUpStoryboard
                    .instantiateViewController(withIdentifier: "RadiusPopUp") as? RadiusPopUp else {
                    return
                }
        radiusPopUp.radiusPopUpDelegate = self
                radiusPopUp.modalPresentationStyle = .custom
                // 기본 팝업 세팅 끝
        
                self.present(radiusPopUp, animated: true, completion: nil)
    }
    
    @IBAction func presentFilter(_ sender: UIButton) {
        let filterPopUpStoryboard = UIStoryboard(name: "FilterPopUp", bundle: Bundle.main)
                guard let filterPopUp = filterPopUpStoryboard
                    .instantiateViewController(withIdentifier: "FilterPopUp") as? FilterPopUp else {
                    return
                }
        filterPopUp.filterPopUpDelegate = self
                filterPopUp.modalPresentationStyle = .custom
                // 기본 팝업 세팅 끝
        
                self.present(filterPopUp, animated: true, completion: nil)
        
    }
    
 
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.isNavigationBarHidden = true
            self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.pagerContainer.frame.width, height: self.pagerContainer.frame.height))
            self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 130, width: self.pagerContainer.frame.width, height: 30))
                scrollView.delegate = self as! UIScrollViewDelegate
            configurePageControl()
            self.pagerContainer.addSubview(scrollView)
//            dataManager.getMainEvents(self)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
            setupFlowLayout()
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization() //권한 요청
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            let coor = locationManager.location?.coordinate
            print("latitude : " + String(describing: coor!.latitude) + "/ longitude : " + String(describing: coor!.longitude))
      


        }
        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
        }
    
    




        override func viewDidAppear(_ animated: Bool) {
    //        PresentLocationAccessView()
            setPageViewInScroll()
        }
        
       
        
        
        func setPageViewInScroll(){
            for index in 0..<4{
                frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
                frame.size = self.scrollView.frame.size
                self.scrollView.isPagingEnabled = true
                
                let subView = UIView(frame: frame)
                subView.backgroundColor = colors[index]
                self.scrollView.addSubview(subView)
            }
            
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.scrollView.frame.size.height)
            
            pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        }
        
        func configurePageControl() {
            // The total number of pages that are available is based on how many available colors we have.
            self.pageControl.numberOfPages = colors.count
            self.pageControl.currentPage = 0
            self.pageControl.tintColor = UIColor.red
            self.pageControl.pageIndicatorTintColor = UIColor.lightGray
            self.pageControl.currentPageIndicatorTintColor = UIColor.orange
            self.pagecontrolContainer.addSubview(pageControl)

        }

        // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
        @objc func changePage(sender: AnyObject) -> () {
            let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
            scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }
  

}

extension FindingGoodRestaurantViewController: LocationPopUpDelegate, AlignPopUpDelegate, RadiusPopUpDelegate, FilterPopUpDelegate{
    
    func pressedDismiss100mRadiusButton() {
        self.distanceLabel.text = "100m"
    }
    func pressedDismiss300mRadiusButton() {
        self.distanceLabel.text = "300m"
    }
    func pressedDismiss500mRadiusButton() {
        self.distanceLabel.text = "500m"
    }
    func pressedDismiss1kmRadiusButton() {
        self.distanceLabel.text = "1km"
    }
    func pressedDismiss3kmRadiusButton() {
        self.distanceLabel.text = "3km"
    }
    
    func pressedDismissFilterButton() {
        //
    }
    func pressedDismissLocationButton(){
        locationButton.setTitle("금천구", for: .normal)
//내 위치 받아서 또는 지역 선택한거 버튼 선택한거 뜨게하는 곳 api연결해서
    }
    

    func pressedDismissRatingButton(){
        alignButton.setTitle("평점순", for: .normal)
    }
    func pressedDismissReviewButton(){
        alignButton.setTitle("리뷰순", for: .normal)
    }
    func pressedDismissDistanceButton(){
        alignButton.setTitle("거리순", for: .normal)
    }
    
    func pressedDismissNoticeButton() {
        //        self.titleLabel.text = "팝업 닫기 완료"

    }
    //locationButton의 text를 선택한 데이터들이 뜨도록 여러개 선택하면 제일 마지막에 누른 것 외 몇갠지(서래마을 외 3곳 이런식)
    


}

extension FindingGoodRestaurantViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //식당 갯수로 바꿔야함
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
    
        cell.restaurantImageview.image = restaurants[indexPath.row]
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)

       if let index = indexPath {
          print("Got clicked on index: \(index)!")
       }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: 170, height: 210)

    } 
}

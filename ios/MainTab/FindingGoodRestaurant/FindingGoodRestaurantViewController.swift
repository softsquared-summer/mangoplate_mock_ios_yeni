//
//  findingGoodRestaurantViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreLocation

public var latitude : Double = 0.0
public var longitude : Double = 0.0
public var gpsLocation : String = ""

class FindingGoodRestaurantViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {
    
    unowned var dataManager: EventMainDataManager {
        get {
            return EventMainDataManager()
        }
    }
    unowned var restaurantDataManager: RestaurantsDataManager {
        get {
            return RestaurantsDataManager()
        }
    }
    
    unowned var nearRegionListDataManager: NearRegionListDataManager {
        get {
            return NearRegionListDataManager()
        }
    }

    
    var restaurantsArea : [String] = []
    var restaurantsImage : [URL] = []
//    var restaurantsStar : [String] = []
    var restaurantsTitle : [String] = []
    var restaurantsDistance : [String] = []
    var restaurantsSeenNum : [String] = []
    var restaurantsReviewNum : [String] = []
    var restaurantsRating : [String] = []
    var restaurantsRatingColor : [String] = []
    
    
    var kind : [String?] = []
    var order : [String?] = []
    var category : [String?] = []
    var price : [String?] = []
    var parking : [String?] = []
    var radius : [String?] = []

    
    
    
    
//    var convertIntArray : [String] = []
//    var convertFloatArray : [String] = []

//    private var restaurants: [UIImage] {
//        var restaurants:[UIImage] = []
//        for i in 0...50 {
//            //배열 길이 50 임의 지정
//            let index = i % 4
//            //이미지 16개 임의 지정
//            let image = UIImage(named: "restaurants\(index)")!
//            //이미지 api로 받아서 넣어야됨 일단 이미지 넣는 방식이 이렇다는거
//            restaurants.append(image)
//        }
//        return restaurants
//    }
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.minimumLineSpacing = 3
        
        let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.99 , height: halfWidth * 0.99)
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
//        var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.black]
    
//        var images : [String] = []
    var images:[URL] = []

//    var images : [UIImage] = []

    
        
        var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        var pageControl: UIPageControl!
        var headerVisible = true

        var locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    
    
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

                self.present(locationPopUp, animated: false, completion: nil)
        
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
        
                self.present(alignPopUp, animated: false, completion: nil)
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
        
                self.present(radiusPopUp, animated: false, completion: nil)
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
        
                self.present(filterPopUp, animated: false, completion: nil)
        
    }
    
 
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.isNavigationBarHidden = true
            self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.pagerContainer.frame.width, height: self.pagerContainer.frame.height))
            self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 130, width: self.pagerContainer.frame.width, height: 30))
                scrollView.delegate = self as! UIScrollViewDelegate
            
            self.pagerContainer.addSubview(scrollView)
            
            
            dataManager.getMainEvents(self)
            
//            configurePageControl()

            locationManager.delegate = self

            locationManager.desiredAccuracy = kCLLocationAccuracyBest
             locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
            
        }
    
  
    

    
    
    func setRestaurantList(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        
        setupFlowLayout()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailRestaurantPopUpStoryboard = UIStoryboard(name: "DetailRestaurantPopUp", bundle: Bundle.main)
                guard let detailRestaurantPopUp = detailRestaurantPopUpStoryboard
                    .instantiateViewController(withIdentifier: "DetailRestaurantPopUp") as? DetailRestaurantPopUp else {
                    return
                }
                detailRestaurantPopUp.detailRestaurantPopUpDelegate = self
                detailRestaurantPopUp.modalPresentationStyle = .custom
                // 기본 팝업 세팅 끝

                self.present(detailRestaurantPopUp, animated: true, completion: nil)
    }
   
    
    
    
    
        override func viewDidAppear(_ animated: Bool) {
    //        PresentLocationAccessView()
            locationAuthCheck()
            restaurantDataManager.getRestaurantsList(self)
//            restaurantDataManager.getRestaurantsList(self, kind, category, price, parking, radius, order)
            nearRegionListDataManager.getCurrentLocation(self)
            //식당 api로 했더니 식당 등록안된 지역의 경우에는 해당 api에서 값이 없기 때문에 동작하지 않음 따라서 내근처 api랑 엮어야함

//            convertIntArray = restaurantsReviewNum.map { String($0) }
//            convertFloatArray = restaurantsRating.map { String($0) }
            setPageViewInScroll()
            configurePageControl()
        }
    
    
    func locationAuthCheck(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            
            latitude = currentLocation.coordinate.latitude
            longitude = currentLocation.coordinate.longitude
            
            
//이 위치를 식당 추천 api에 넣음
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthCheck()
        }
    }
    
        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
        }
    
    




        
       
        
        
        func setPageViewInScroll(){
            for index in 0..<4{
                frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
                frame.size = self.scrollView.frame.size
                self.scrollView.isPagingEnabled = true
                
                let subView = UIImageView(frame: frame)
//                subView.backgroundColor = colors[index]
                subView.af_setImage(withURL: images[index])
//                subView.image = UIImage(named: "\( images[index])")
//
//              subView.image =  images[index]
//                subView.af_setImage(withURL: images[index])
                self.scrollView.addSubview(subView)
            }
            
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4, height: self.scrollView.frame.size.height)
            
            pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        }
        
        func configurePageControl() {
            // The total number of pages that are available is based on how many available colors we have.
//            self.pageControl.numberOfPages = colors.count
            self.pageControl.numberOfPages = images.count

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

//extension FindingGoodRestaurantViewController: LocationPopUpDelegate, AlignPopUpDelegate, RadiusPopUpDelegate, FilterPopUpDelegate, DetailRestaurantPopUpDelegate{
//
//
//
//}

extension FindingGoodRestaurantViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, LocationPopUpDelegate, AlignPopUpDelegate, RadiusPopUpDelegate, FilterPopUpDelegate, DetailRestaurantPopUpDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantsTitle.count
        //식당 갯수로 바꿔야함
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        locationButton.setTitle(restaurantsArea[indexPath.row], for: .normal)
//    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
    
        cell.restaurantArea.text = restaurantsArea[indexPath.row]
        
        cell.restaurantImageview.af_setImage(withURL: restaurantsImage[indexPath.row])
        
        cell.restaurantTitle.text = restaurantsTitle[indexPath.row]
        
        cell.restaurantDistance.text = restaurantsDistance[indexPath.row]
        
        cell.restaurantSeenNum.text = restaurantsSeenNum[indexPath.row]
        
        cell.restaurantReviewNum.text = restaurantsReviewNum[indexPath.row]
        
        cell.restaurantRating.text = restaurantsRating[indexPath.row]
        
        cell.restaurantRating.textColor =  .orange
        
//        cell.isUserInteractionEnabled = true
        
        return cell
    }
    
//    @objc func tap(_ sender: UITapGestureRecognizer) {
//
//       let location = sender.location(in: self.collectionView)
//       let indexPath = self.collectionView.indexPathForItem(at: location)
//
//       if let index = indexPath {
//
//
//          print("Got clicked on index: \(index)!")
//       }
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: 170, height: 235)

    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print("cell:\(indexPath.row)")
//
//        let detailRestaurantPopUpStoryboard = UIStoryboard(name: "DetailRestaurantPopUp", bundle: Bundle.main)
//                guard let detailRestaurantPopUp = detailRestaurantPopUpStoryboard
//                    .instantiateViewController(withIdentifier: "DetailRestaurantPopUp") as? DetailRestaurantPopUp else {
//                    return
//                }
//                detailRestaurantPopUp.detailRestaurantPopUpDelegate = self
//                detailRestaurantPopUp.modalPresentationStyle = .custom
//                // 기본 팝업 세팅 끝
//
//                self.present(detailRestaurantPopUp, animated: true, completion: nil)
//
//
//    }
    

        func pressedDismiss500mRadiusButton() {
            self.distanceLabel.text = "500m"
    //        radius.insert("0.5", at: order.endIndex - 1)
            radius.append("0.5")


        }
        func pressedDismiss1kmRadiusButton() {
            self.distanceLabel.text = "1km"
    //        radius.insert("1", at: order.endIndex - 1)
            radius.append("1")


        }
        func pressedDismiss3kmRadiusButton() {
            self.distanceLabel.text = "3km"
    //        radius.insert("3", at: order.endIndex - 1)
            radius.append("3")


        }
        
        func pressedDismissFilterButton() {
    //        category.insert(categories, at: category.endIndex - 1)
            category.append(categories)

    //        parking.insert(carParking, at: parking.endIndex - 1)
            parking.append(carParking)


            for i in 0..<foodKind.count{
                kind.insert(foodKind[i], at: i)
    //            kind.append(foodKind[i])

            }
            for i in 0..<prices.count{
                price.insert(prices[i], at: i)
    //            price.append(prices[i])

            }

        }
        func pressedDismissLocationButton(){
            
    //내 위치 받아서 또는 지역 선택한거 버튼 선택한거 뜨게하는 곳 api연결해서
        }
        func pressedDetailRestaurantButton(){
        }
        

        func pressedDismissRatingButton(){
            alignButton.setTitle("평점순", for: .normal)
            selectedAlign = "평점순"
    //        order.insert("평점순", at: order.endIndex - 1)
            order.append("평점순")

            //eatDealGangBukGuViewController.dongs.insert(distinctResponse.result[index].name, at: index)

          
        }
        func pressedDismissReviewButton(){
            alignButton.setTitle("리뷰순", for: .normal)
            selectedAlign = "리뷰순"
    //        order.insert("리뷰순", at: order.endIndex - 1)
            order.append("리뷰순")



        }
        func pressedDismissDistanceButton(){
            alignButton.setTitle("거리순", for: .normal)
            selectedAlign = "거리순"
    //        order.insert("거리순", at: order.endIndex - 1)
            order.append("거리순")



        }
        
        func pressedDismissNoticeButton() {
            //        self.titleLabel.text = "팝업 닫기 완료"

        }
        //locationButton의 text를 선택한 데이터들이 뜨도록 여러개 선택하면 제일 마지막에 누른 것 외 몇갠지(서래마을 외 3곳 이런식)
        

}
//
//extension FindingGoodRestaurantViewController: CustomCellDelegate {
//    func sharePressed(cell: CollectionViewCell) {
//        guard let index = collectionView.indexPath(for: cell)?.row else { return }
//        //fetch the dataSource object using index
//        let detailRestaurantPopUpStoryboard = UIStoryboard(name: "DetailRestaurantPopUp", bundle: Bundle.main)
//        guard let detailRestaurantPopUp = detailRestaurantPopUpStoryboard
//            .instantiateViewController(withIdentifier: "DetailRestaurantPopUp") as? DetailRestaurantPopUp else {
//            return
//        }
//        detailRestaurantPopUp.detailRestaurantPopUpDelegate = self
//        detailRestaurantPopUp.modalPresentationStyle = .custom
//        // 기본 팝업 세팅 끝
//
//        self.present(detailRestaurantPopUp, animated: true, completion: nil)
//    }
//}

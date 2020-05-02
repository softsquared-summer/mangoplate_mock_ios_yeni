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

    var pageViewController : UIPageViewController!
        var pageTitles: NSArray!
        var pageImages: NSArray!
        var scrollView: UIScrollView!
        var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.black]
    
        
        var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        var pageControl: UIPageControl!
        var headerVisible = true

        var locationManager:CLLocationManager!

        @IBOutlet weak var pagecontrolContainer: UIView!
        @IBOutlet weak var pagerContainer: UIView!
       
        @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var alignButton: UIButton!
    
    @IBAction func presentLocationList(_ sender: UIButton) {
        
        let locationPopUpvc = LocationPopUpViewController() //change this to your class name
        locationPopUpvc.modalPresentationStyle = .custom
        self.present(locationPopUpvc, animated: true, completion: nil)
        
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
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
                    locationManager.requestWhenInUseAuthorization() //권한 요청
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    locationManager.startUpdatingLocation()
            



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

extension FindingGoodRestaurantViewController: NoticePopUpDelegate, AlignPopUpDelegate, RadiusPopUpDelegate, FilterPopUpDelegate{
    
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

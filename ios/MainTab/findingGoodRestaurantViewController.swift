//
//  findingGoodRestaurantViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreLocation

class findingGoodRestaurantViewController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {

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


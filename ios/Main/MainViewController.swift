//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController , UIScrollViewDelegate {
   
    var pageViewController : UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    var scrollView: UIScrollView!
    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.black]
    
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var pageControl: UIPageControl!
    var headerVisible = true
    var PresentLocationAccessViewCount = 0 //왜 안될까--------------------
    
    @IBOutlet weak var pagecontrolContainer: UIView!
    @IBOutlet weak var pagerContainer: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    
    


    @IBAction func pressedPresentMainViewController(_ sender: UIButton) {
        self.PresentLocationAccessViewCount = 1 //왜 안될까--------------------
        let MainVC = MainViewController() //change this to your class name
        MainVC.modalPresentationStyle = .fullScreen
        self.present(MainVC, animated: true, completion: nil)
    }
    
    @IBAction func pressedPresentSecondMainViewController(_ sender: UIButton) {
        let secondMainVC = SecondMainViewController() //change this to your class name
        secondMainVC.modalPresentationStyle = .fullScreen
        self.present(secondMainVC, animated: true, completion: nil)
    }
    
    
    @IBAction func pressedPresentThreeMainViewController(_ sender: UIButton) {
        let threeMainVC = ThreeMainViewController() //change this to your class name
        threeMainVC.modalPresentationStyle = .fullScreen
        self.present(threeMainVC, animated: true, completion: nil)
    }
    
    @IBAction func pressedPresentFourthMainViewController(_ sender: UIButton) {
        let fourthMainVC = FourthMainViewController() //change this to your class name
        fourthMainVC.modalPresentationStyle = .fullScreen
        self.present(fourthMainVC, animated: true, completion: nil)
    }
    @IBAction func pressedPresentFiveMainViewController(_ sender: UIButton) {
        let fiveMainVC = FiveMainViewController() //change this to your class name
        fiveMainVC.modalPresentationStyle = .fullScreen
        self.present(fiveMainVC, animated: true, completion: nil)
    }
    //    @IBOutlet weak var titleLabel: UILabel!
//
//    @IBAction func pressedGetTutorials(_ sender: UIButton) {
//        MainDataManager().getTutorials(self)
//    }
//
//    @IBAction func pressedPresentPopUpView(_ sender: UIButton) {
//        let noticePopUpStoryboard = UIStoryboard(name: "NoticePopUp", bundle: Bundle.main)
//        guard let noticePopUp = noticePopUpStoryboard
//            .instantiateViewController(withIdentifier: "NoticePopUp") as? NoticePopUp else {
//            return
//        }
//        noticePopUp.noticePopUpDelegate = self
//        noticePopUp.modalPresentationStyle = .custom
//        // 기본 팝업 세팅 끝
//
//        self.present(noticePopUp, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.pagerContainer.frame.width, height: self.pagerContainer.frame.height))
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 130, width: self.pagerContainer.frame.width, height: 30))
            scrollView.delegate = self as! UIScrollViewDelegate
        configurePageControl()
        self.pagerContainer.addSubview(scrollView)
        if PresentLocationAccessViewCount == 0{ //PresentLocationAccessViewCount가 최초 허용할 때만 실행 //왜 안될까--------------------
            DispatchQueue.global(qos: .utility).async {
               
                DispatchQueue.main.async {
                        self.PresentLocationAccessViewCount = 1 // PresentLocationAccessViewCount가 이미 허용했음을 의미 //왜 안될까--------------------
                        self.PresentLocationAccessView()
                
                }
            }//UIAlertController는 일반적으로 viewDidAppear에서 쓰인다. 하지만 ThreeMainViewController에서 MainViewController로 돌아올 경우 알림이 허용된 상태기 때문에 알림창이 뜨면안된다. 따라서 DispatchQueue를 사용해서 viewDidLoad에 작성했다.
        //하지만 pressedPresentMainViewController()를 사용했을 때는 MainViewController가 로드되기 때문에 알림이 뜨게된다 이 점을 해결해야한다.
        }
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
 
    
    
    func PresentLocationAccessView(){
//        let attributedString = NSAttributedString(string: "",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let alert = UIAlertController(title:"", message:"", preferredStyle: .alert)
        
        alert.setValue(NSAttributedString(string: "'MangoPlate'이(가) 사용자의 위치에 접근하도록 허용하겠습니까?", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: "접근을 허용하면, 현재 위치를 활용하여 주변의 가까운 식당을 편하게 찾을 수 있어요.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedMessage")
        let AllowUsingTheApp = UIAlertAction(title: "허용", style: .default, handler: nil)
//        let AllowWhileUsingTheApp = UIAlertAction(title: "앱을 사용하는 동안 허용", style: .default, handler: nil)
//
//
//        let OnceAllowed = UIAlertAction(title: "한 번 허용", style: .default, handler: nil)
//        let Disallow = UIAlertAction(title: "허용 안 함", style: .default, handler: nil)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.darkGray

        alert.addAction(AllowUsingTheApp)

//        alert.addAction(AllowWhileUsingTheApp)
//        alert.addAction(OnceAllowed)
//        alert.addAction(Disallow)
        alert.preferredAction = AllowUsingTheApp
        self.present(alert, animated: true, completion: nil)

    }
    
}


//extension MainViewController: NoticePopUpDelegate {
//    func pressedDismissButton() {
//        self.titleLabel.text = "팝업 닫기 완료"
//    }
//
//
//}

//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
   
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    
    


    @IBAction func goToSecondViewTest(_ sender: UIButton) {
        let secondMainVC = SecondMainViewController() //change this to your class name
               secondMainVC.modalPresentationStyle = .fullScreen
               self.present(secondMainVC, animated: true, completion: nil)
    }
    
    
    @IBAction func pressedPresentThreeMainViewController(_ sender: UIButton) {
        let threeMainVC = ThreeMainViewController() //change this to your class name
        threeMainVC.modalPresentationStyle = .fullScreen
        self.present(threeMainVC, animated: true, completion: nil)
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
    }
    override func viewDidAppear(_ animated: Bool) {
        PresentLocationAccessView()
    }
    
    
    func PresentLocationAccessView(){
//        let attributedString = NSAttributedString(string: "",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let alert = UIAlertController(title:"", message:"", preferredStyle: .alert)
        
        alert.setValue(NSAttributedString(string: "'MangoPlate'이(가) 사용자의 위치에 접근하도록 허용하겠습니까?", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: "접근을 허용하면, 현재 위치를 활용하여 주변의 가까운 식당을 편하게 찾을 수 있어요.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedMessage")

        let AllowWhileUsingTheApp = UIAlertAction(title: "앱을 사용하는 동안 허용", style: .default, handler: nil)

        
        let OnceAllowed = UIAlertAction(title: "한 번 허용", style: .default, handler: nil)
        let Disallow = UIAlertAction(title: "허용 안 함", style: .default, handler: nil)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.darkGray

        
        alert.addAction(AllowWhileUsingTheApp)
        alert.addAction(OnceAllowed)
        alert.addAction(Disallow)
        alert.preferredAction = AllowWhileUsingTheApp
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

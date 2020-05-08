//
//  EventViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    unowned var dataManager: EventDetailDataManager {
        get {
            return EventDetailDataManager()
        }
    }
    
    @IBOutlet weak var FirstEventImageView: UIImageView!
    @IBOutlet weak var FirstEventTitleLabel: UILabel!
    @IBOutlet weak var FirstEventDateLabel: UILabel!
    @IBOutlet weak var SecondEventImageView: UIImageView!
    @IBOutlet weak var SecondEventTitleLabel: UILabel!
    @IBOutlet weak var SecondEventDateLabel: UILabel!
    @IBOutlet weak var ThirdEventImageView: UIImageView!
    @IBOutlet weak var ThirdEventTitleLabel: UILabel!
    @IBOutlet weak var ThirdEventDateLabel: UILabel!
    @IBOutlet weak var FourthEventImageView: UIImageView!
    @IBOutlet weak var FourthEventTitleLabel: UILabel!
    @IBOutlet weak var FourthEventDateLabel: UILabel!
    @IBOutlet weak var FifthEventImageView: UIImageView!
    @IBOutlet weak var FifthEventTitleLabel: UILabel!
    @IBOutlet weak var FifthEventDateLabel: UILabel!
    @IBOutlet weak var SixthEventImageView: UIImageView!
    @IBOutlet weak var SixthEventTitleLabel: UILabel!
    @IBOutlet weak var SixthEventDateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getDetailEvents(self)
        
        var backImage = UIImage(named: "ic_left_arrow_orange.png")

               var backbutton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(self.backAction))
        backbutton.tintColor = .orange
        var lefttitle = UIBarButtonItem()
        lefttitle.title = "이벤트"

        lefttitle.tintColor = .orange
        let attributes: [NSAttributedString.Key : Any] = [ .font: UIFont.boldSystemFont(ofSize: 17) ]
        lefttitle.setTitleTextAttributes(attributes, for: .normal)


                navigationItem.leftBarButtonItems = [backbutton, lefttitle]
         
//                backbutton.setTitle("이벤트", for: .normal)
//                backbutton.tintColor = .orange
        //        backbutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//                backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
//
//                backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
//
//                self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
        
                
        // Do any additional setup after loading the view.
    }
    @objc func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func presentFirstEventView(_ sender: UIButton) {
        let firstEventViewController: UINavigationController = UINavigationController(rootViewController: FirstEventViewController())
        firstEventViewController.modalPresentationStyle = .fullScreen

        self.present(firstEventViewController, animated: true, completion: nil)
    }
    
    @IBAction func presentSecondEventView(_ sender: UIButton) {
        let secondEventViewController: UINavigationController = UINavigationController(rootViewController: SecondEventViewController())
        secondEventViewController.modalPresentationStyle = .fullScreen

        self.present(secondEventViewController, animated: true, completion: nil)
    }
    @IBAction func presentThirdEventView(_ sender: UIButton) {
        let thirdEventViewController: UINavigationController = UINavigationController(rootViewController: ThirdEventViewController())
        thirdEventViewController.modalPresentationStyle = .fullScreen

        self.present(thirdEventViewController, animated: true, completion: nil)
    }
    @IBAction func presentFourthEventView(_ sender: UIButton) {
        let fourthEventViewController: UINavigationController = UINavigationController(rootViewController: FourthEventViewController())
        fourthEventViewController.modalPresentationStyle = .fullScreen

        self.present(fourthEventViewController, animated: true, completion: nil)
    }
    @IBAction func presentFifthEventView(_ sender: UIButton) {
        let fifthEventViewController: UINavigationController = UINavigationController(rootViewController: FifthEventViewController())
        fifthEventViewController.modalPresentationStyle = .fullScreen

        self.present(fifthEventViewController, animated: true, completion: nil)
    }
    
    @IBAction func presentSixthEventView(_ sender: UIButton) {
        let sixthEventViewController: UINavigationController = UINavigationController(rootViewController: SixthEventViewController())
        sixthEventViewController.modalPresentationStyle = .fullScreen

        self.present(sixthEventViewController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




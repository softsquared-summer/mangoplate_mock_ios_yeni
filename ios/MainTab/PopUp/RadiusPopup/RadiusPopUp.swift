//
//  RadiusPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import UIKit
public var selectedDistance : String = "3"

class RadiusPopUp: BaseViewController {
    var radiusPopUpDelegate: RadiusPopUpDelegate!
    
    
    @IBOutlet weak var fiveHundredMeterButton: UIButton!
    
    @IBOutlet weak var oneKilometerButton: UIButton!
    
    @IBOutlet weak var threeKilometerButton: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func pressedRadiusDismiss(_ sender: UIButton) {
           

        self.dismiss(animated: false, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if (selectedDistance == "0.5"){
                    distanceLabel.text = "500m"
        
        }else if(selectedDistance == "1"){
                distanceLabel.text = "1km"
        }else if(selectedDistance == "3"){
            distanceLabel.text = "3km"

        }
            
//        distanceLabel.text = selectedDistance
        if (distanceLabel.text == "500m"){
            fiveHundredMeterButton.setImage(UIImage(named: "ic_big_location.png"), for: .normal)
            oneKilometerButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
            threeKilometerButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
            
        } else if(distanceLabel.text == "1km"){
            fiveHundredMeterButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
            oneKilometerButton.setImage(UIImage(named: "ic_big_location.png"), for: .normal)
            threeKilometerButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
        } else if(distanceLabel.text == "3km"){
            fiveHundredMeterButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
            oneKilometerButton.setImage(UIImage(named: "ic_small_location.png"), for: .normal)
            threeKilometerButton.setImage(UIImage(named: "ic_big_location.png"), for: .normal)
        }
    }
    
//    @IBAction func sliderValueChanged(_ sender: UISlider) {
//
//        var current = Int(sender.value) //UISlider(sender)의 value를 Int로 캐스팅해서 current라는 변수로 보낸다.
//        if current >= 100 && current < 300{
//            current = 100
//            distanceLabel.text = "\(current)m"
//            self.radiusPopUpDelegate.pressedDismiss100mRadiusButton()
//            self.dismiss(animated: false, completion: nil)
//
//
//        } else if current >= 300 && current < 500{
//            current = 300
//            distanceLabel.text = "\(current)m"
//            self.radiusPopUpDelegate.pressedDismiss300mRadiusButton()
//            self.dismiss(animated: false, completion: nil)
//
//        } else if current >= 500 && current < 1000{
//            current = 500
//            distanceLabel.text = "\(current)m"
//            self.radiusPopUpDelegate.pressedDismiss500mRadiusButton()
//            self.dismiss(animated: false, completion: nil)
//
//        } else if current >= 1000 && current < 3000{
//            current = 1000
//            current = current / 1000
//            distanceLabel.text = "\(current)km"
//            self.radiusPopUpDelegate.pressedDismiss1kmRadiusButton()
//            self.dismiss(animated: false, completion: nil)
//
//        }else{
//            current = 3000
//            current = current / 1000
//            distanceLabel.text = "\(current)km"
//            self.radiusPopUpDelegate.pressedDismiss3kmRadiusButton()
//            self.dismiss(animated: false, completion: nil)
//
//
//        }
////        if current >= 1000{
////            current = current / 1000
////            distanceLabel.text = "\(current)km"
////
////        }else{
////            distanceLabel.text = "\(current)m" // value의 text가 나타내는것은 current의 값이다.
////
////        }
//
//
//    }//슬라이더 100,300,500,1000,3000을 액션으로 하는게 가능하다면 메서드로 각각 구현해서 100일때의 delegate를 그 메서드에도 써줘야 label이 변경될 수 있음
    
    @IBAction func presentfiveHundredMeter(_ sender: UIButton) {
        distanceLabel.text = "500m"
        selectedDistance = "0.5"
        
        self.radiusPopUpDelegate.pressedDismiss500mRadiusButton()
        self.dismiss(animated: false, completion: nil)

        
    }
    @IBAction func presentoneKilometerButton(_ sender: UIButton) {
        distanceLabel.text = "1km"
        selectedDistance = "1"
        
        self.radiusPopUpDelegate.pressedDismiss1kmRadiusButton()
        self.dismiss(animated: false, completion: nil)

    }
    @IBAction func presentthreeKilometerButton(_ sender: UIButton) {
        distanceLabel.text = "3km"
        selectedDistance = "3"
        

        self.radiusPopUpDelegate.pressedDismiss3kmRadiusButton()
        self.dismiss(animated: false, completion: nil)

    }
    
    
    
    
    
}

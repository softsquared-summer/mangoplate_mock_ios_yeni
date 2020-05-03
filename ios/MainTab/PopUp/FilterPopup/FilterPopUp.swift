//
//  FilterPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FilterPopUp: BaseViewController {
    
    @IBOutlet weak var koreanfoodButton: UIButton!
    @IBOutlet weak var japanesefoodButton: UIButton!
    @IBOutlet weak var chinesefoodButton: UIButton!
    @IBOutlet weak var westernfoodButton: UIButton!
    @IBOutlet weak var worldfoodButton: UIButton!
    @IBOutlet weak var buffetButton: UIButton!
    @IBOutlet weak var cafeButton: UIButton!
    @IBOutlet weak var pubButton: UIButton!
    
    @IBOutlet weak var lessThanTenThousandWonButton: UIButton!
    @IBOutlet weak var tenThousandWonRangeButton: UIButton!
    @IBOutlet weak var twentyThousandWonRangeButton: UIButton!
    @IBOutlet weak var thirtyThousandWonRangeButton: UIButton!
    
    @IBOutlet weak var ParkingAvailableButton: UIButton!
    @IBOutlet weak var NoParkingAvailableButton: UIButton!
    
    var filterPopUpDelegate: FilterPopUpDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedFilterDismiss(_ sender: UIButton) {
        self.filterPopUpDelegate.pressedDismissFilterButton()
        self.dismiss(animated: false, completion: nil)
    }
    
    var koreanfoodButtonTappedCount : Int = 0
    var japanesefoodButtonTappedCount : Int = 0
    var chinesefoodButtonTappedCount : Int = 0
    var westernfoodButtonTappedCount : Int = 0
    var worldfoodButtonTappedCount : Int = 0
    var buffetButtonTappedCount : Int = 0
    var cafeButtonTappedCount : Int = 0
    var pubButtonTappedCount : Int = 0
    var lessThanTenThousandWonButtonTappedCount : Int = 0
    var tenThousandWonRangeButtonTappedCount : Int = 0
    var twentyThousandWonRangeButtonTappedCount : Int = 0
    var thirtyThousandWonRangeButtonTappedCount : Int = 0


    
    @IBAction func changekoreanfoodImageColor(_ sender: UIButton) {
        koreanfoodButtonTappedCount += 1

        if(koreanfoodButtonTappedCount % 2 == 0) {
            koreanfoodButton.setImage(UIImage(named: "ic_korean_food_gray"), for: .normal)
        } else {
            koreanfoodButton.setImage(UIImage(named: "ic_korean_food_orange"), for: .normal)
        }
        
    }
    @IBAction func changejapanesefoodImageColor(_ sender: UIButton) {
        japanesefoodButtonTappedCount += 1

        if(japanesefoodButtonTappedCount % 2 == 0) {
            japanesefoodButton.setImage(UIImage(named: "ic_japanese_food_gray"), for: .normal)
        } else {
            japanesefoodButton.setImage(UIImage(named: "ic_japanese_food_orange"), for: .normal)
        }
        
    }
    @IBAction func changechinesefoodImageColor(_ sender: UIButton) {
        chinesefoodButtonTappedCount += 1

        if(chinesefoodButtonTappedCount % 2 == 0) {
            chinesefoodButton.setImage(UIImage(named: "ic_chinese_food_gray"), for: .normal)
        } else {
            chinesefoodButton.setImage(UIImage(named: "ic_chinese_food_orange"), for: .normal)
        }
        
        
    }
    @IBAction func changewesternfoodImageColor(_ sender: UIButton) {
        westernfoodButtonTappedCount += 1

        if(westernfoodButtonTappedCount % 2 == 0) {
            westernfoodButton.setImage(UIImage(named: "ic_western_food_gray"), for: .normal)
        } else {
            westernfoodButton.setImage(UIImage(named: "ic_western_food_orange"), for: .normal)
        }
        
        
    }
    @IBAction func changeworldfoodImageColor(_ sender: UIButton) {
        worldfoodButtonTappedCount += 1

        if(worldfoodButtonTappedCount % 2 == 0) {
            worldfoodButton.setImage(UIImage(named: "ic_world_food_gray"), for: .normal)
        } else {
            worldfoodButton.setImage(UIImage(named: "ic_world_food_orange"), for: .normal)
        }
        
        
    }
    @IBAction func changebuffetImageColor(_ sender: UIButton) {
        buffetButtonTappedCount += 1

        if(buffetButtonTappedCount % 2 == 0) {
            buffetButton.setImage(UIImage(named: "ic_buffet_gray"), for: .normal)
        } else {
            buffetButton.setImage(UIImage(named: "ic_buffet_orange"), for: .normal)
        }
        
        
    }
    @IBAction func changecafeImageColor(_ sender: UIButton) {
        cafeButtonTappedCount += 1

        if(cafeButtonTappedCount % 2 == 0) {
            cafeButton.setImage(UIImage(named: "ic_cafe_gray"), for: .normal)
        } else {
            cafeButton.setImage(UIImage(named: "ic_cafe_orange"), for: .normal)
        }
        
        
    }
    @IBAction func changepubImageColor(_ sender: UIButton) {
        pubButtonTappedCount += 1

        if(pubButtonTappedCount % 2 == 0) {
            pubButton.setImage(UIImage(named: "ic_pub_gray"), for: .normal)
        } else {
            pubButton.setImage(UIImage(named: "ic_pub_orange"), for: .normal)
        }
        
        
    }
    
    @IBAction func changelessThanTenThousandWonColor(_ sender: UIButton) {
        lessThanTenThousandWonButtonTappedCount += 1

        if(lessThanTenThousandWonButtonTappedCount % 2 == 0) {
            lessThanTenThousandWonButton.setImage(UIImage(named: "ic_lessThanTenThousandWon_gray"), for: .normal)
        } else {
            lessThanTenThousandWonButton.setImage(UIImage(named: "ic_lessThanTenThousandWon_orange"), for: .normal)
        }
    }
    @IBAction func changeTenThousandWonRangeColor(_ sender: UIButton) {
        tenThousandWonRangeButtonTappedCount += 1

        if(tenThousandWonRangeButtonTappedCount % 2 == 0) {
            tenThousandWonRangeButton.setImage(UIImage(named: "ic_tenThousandWonRange_gray"), for: .normal)
        } else {
            tenThousandWonRangeButton.setImage(UIImage(named: "ic_tenThousandWonRange_orange"), for: .normal)
        }
    }
    @IBAction func changetwentyThousandWonRangeColor(_ sender: UIButton) {
        twentyThousandWonRangeButtonTappedCount += 1

        if(twentyThousandWonRangeButtonTappedCount % 2 == 0) {
            twentyThousandWonRangeButton.setImage(UIImage(named: "ic_twentyThousandWonRange_gray"), for: .normal)
        } else {
            twentyThousandWonRangeButton.setImage(UIImage(named: "ic_twentyThousandWonRange_orange"), for: .normal)
        }
    }
    @IBAction func changeThirtyThousandWonRangeColor(_ sender: UIButton) {
        thirtyThousandWonRangeButtonTappedCount += 1

        if(thirtyThousandWonRangeButtonTappedCount % 2 == 0) {
            thirtyThousandWonRangeButton.setImage(UIImage(named: "ic_thirtyThousandWonRange_gray"), for: .normal)
        } else {
            thirtyThousandWonRangeButton.setImage(UIImage(named: "ic_thirtyThousandWonRange_orange"), for: .normal)
        }
    }
    
    
    @IBAction func changeParkingAvailableColor(_ sender: UIButton) {
        ParkingAvailableButton.setTitleColor(.orange, for: .normal)
        NoParkingAvailableButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func changeNoParkingAvailableColor(_ sender: UIButton) {
        NoParkingAvailableButton.setTitleColor(.orange, for: .normal)
        ParkingAvailableButton.setTitleColor(.black, for: .normal)

    }
    
}

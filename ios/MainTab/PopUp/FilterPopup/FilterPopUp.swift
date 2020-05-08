//
//  FilterPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

var categories : String = "전체"
var foodKind : [String] = []
var prices : [String] = []
var carParking : String = "상관없음"

class FilterPopUp: BaseViewController {
    
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var wantToGoButton: UIButton!
    @IBOutlet weak var haveBeenThereButton: UIButton!
    
    @IBOutlet weak var koreanfoodButton: UIButton!
    @IBOutlet weak var japanesefoodButton: UIButton!
    @IBOutlet weak var chinesefoodButton: UIButton!
    @IBOutlet weak var westernfoodButton: UIButton!
    @IBOutlet weak var worldfoodButton: UIButton!
    @IBOutlet weak var buffetButton: UIButton!
    @IBOutlet weak var cafeButton: UIButton!
    @IBOutlet weak var pubButton: UIButton!
    
    @IBOutlet weak var koreanfoodLabel: UILabel!
    @IBOutlet weak var japanesefoodLabel: UILabel!
    @IBOutlet weak var chinesefoodLabel: UILabel!
    @IBOutlet weak var westernfoodLabel: UILabel!
    @IBOutlet weak var worldfoodLabel: UILabel!
    @IBOutlet weak var buffetLabel: UILabel!
    @IBOutlet weak var cafeLabel: UILabel!
    @IBOutlet weak var pubLabel: UILabel!
    
    
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


    @IBAction func changeAllImageColor(_ sender: UIButton) {
        allButton.setImage(UIImage(named: "ic_all_orange.png"), for: .normal)
        wantToGoButton.setImage(UIImage(named: "ic_wantToGo_gray.png"), for: .normal)
        haveBeenThereButton.setImage(UIImage(named: "ic_haveBeenThere_gray.png"), for: .normal)
        categories = "전체"
    }
    
    @IBAction func changeWantToGoImageColor(_ sender: UIButton) {
        allButton.setImage(UIImage(named: "ic_all_gray.png"), for: .normal)
        wantToGoButton.setImage(UIImage(named: "ic_wantToGo_orange.png"), for: .normal)
        haveBeenThereButton.setImage(UIImage(named: "ic_haveBeenThere_gray.png"), for: .normal)
        categories = "가고싶다"

        
    }
    
    @IBAction func changeHaveBeenThereImageColor(_ sender: UIButton) {
        allButton.setImage(UIImage(named: "ic_all_gray.png"), for: .normal)
        wantToGoButton.setImage(UIImage(named: "ic_wantToGo_gray.png"), for: .normal)
        haveBeenThereButton.setImage(UIImage(named: "ic_haveBeenThere_orange.png"), for: .normal)
        //가봤어요는 팀원들간의 협의에 따라 구현하지 않기로 해서 값을 넣지 않습니다.
    }
    
    @IBAction func changekoreanfoodImageColor(_ sender: UIButton) {
        koreanfoodButtonTappedCount += 1

        if(koreanfoodButtonTappedCount % 2 == 0) {
            koreanfoodButton.setImage(UIImage(named: "ic_korean_food_gray"), for: .normal)
            koreanfoodLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "한식") {
                foodKind.remove(at: index)
            }
        } else {
            koreanfoodButton.setImage(UIImage(named: "ic_korean_food_orange"), for: .normal)
            koreanfoodLabel.textColor = .orange
//            foodKind.insert("한식", at: foodKind.endIndex - 1)
            foodKind.append("한식")


        }
        
    }
    @IBAction func changejapanesefoodImageColor(_ sender: UIButton) {
        japanesefoodButtonTappedCount += 1

        if(japanesefoodButtonTappedCount % 2 == 0) {
            japanesefoodButton.setImage(UIImage(named: "ic_japanese_food_gray"), for: .normal)
            japanesefoodLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "일식") {
                foodKind.remove(at: index)
            }
        } else {
            japanesefoodButton.setImage(UIImage(named: "ic_japanese_food_orange"), for: .normal)
            japanesefoodLabel.textColor = .orange
//            foodKind.insert("일식", at: foodKind.endIndex - 1)
            foodKind.append("일식")


        }
        
    }
    @IBAction func changechinesefoodImageColor(_ sender: UIButton) {
        chinesefoodButtonTappedCount += 1

        if(chinesefoodButtonTappedCount % 2 == 0) {
            chinesefoodButton.setImage(UIImage(named: "ic_chinese_food_gray"), for: .normal)
            chinesefoodLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "중식") {
                foodKind.remove(at: index)
            }

        } else {
            chinesefoodButton.setImage(UIImage(named: "ic_chinese_food_orange"), for: .normal)
            chinesefoodLabel.textColor = .orange
//            foodKind.insert("중식", at: foodKind.endIndex - 1)
            foodKind.append("중식")


        }
        
        
    }
    @IBAction func changewesternfoodImageColor(_ sender: UIButton) {
        westernfoodButtonTappedCount += 1

        if(westernfoodButtonTappedCount % 2 == 0) {
            westernfoodButton.setImage(UIImage(named: "ic_western_food_gray"), for: .normal)
            westernfoodLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "양식") {
                foodKind.remove(at: index)
            }

        } else {
            westernfoodButton.setImage(UIImage(named: "ic_western_food_orange"), for: .normal)
            westernfoodLabel.textColor = .orange
//            foodKind.insert("양식", at: foodKind.endIndex - 1)
            foodKind.append("양식")


        }
        
        
    }
    @IBAction func changeworldfoodImageColor(_ sender: UIButton) {
        worldfoodButtonTappedCount += 1

        if(worldfoodButtonTappedCount % 2 == 0) {
            worldfoodButton.setImage(UIImage(named: "ic_world_food_gray"), for: .normal)
            worldfoodLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "세계음식") {
                foodKind.remove(at: index)
            }

        } else {
            worldfoodButton.setImage(UIImage(named: "ic_world_food_orange"), for: .normal)
            worldfoodLabel.textColor = .orange
//            foodKind.insert("세계음식", at: foodKind.endIndex - 1)
            foodKind.append("세계음식")


        }
        
        
    }
    @IBAction func changebuffetImageColor(_ sender: UIButton) {
        buffetButtonTappedCount += 1

        if(buffetButtonTappedCount % 2 == 0) {
            buffetButton.setImage(UIImage(named: "ic_buffet_gray"), for: .normal)
            buffetLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "뷔페"){
                           foodKind.remove(at: index)
            }

        } else {
            buffetButton.setImage(UIImage(named: "ic_buffet_orange"), for: .normal)
            buffetLabel.textColor = .orange
//            foodKind.insert("뷔페", at: foodKind.endIndex - 1)
            foodKind.append("뷔페")


        }
        
        
    }
    @IBAction func changecafeImageColor(_ sender: UIButton) {
        cafeButtonTappedCount += 1

        if(cafeButtonTappedCount % 2 == 0) {
            cafeButton.setImage(UIImage(named: "ic_cafe_gray"), for: .normal)
            cafeLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "카페"){
                foodKind.remove(at: index)
            }

        } else {
            cafeButton.setImage(UIImage(named: "ic_cafe_orange"), for: .normal)
            cafeLabel.textColor = .orange
//            foodKind.insert("카페", at: foodKind.endIndex - 1)
            foodKind.append("카페")


        }
        
        
    }
    @IBAction func changepubImageColor(_ sender: UIButton) {
        pubButtonTappedCount += 1

        if(pubButtonTappedCount % 2 == 0) {
            pubButton.setImage(UIImage(named: "ic_pub_gray"), for: .normal)
            pubLabel.textColor = .lightGray
            if let index = foodKind.firstIndex(of: "주점"){
                foodKind.remove(at: index)
            }

        } else {
            pubButton.setImage(UIImage(named: "ic_pub_orange"), for: .normal)
            pubLabel.textColor = .orange
//            foodKind.insert("주점", at: foodKind.endIndex - 1)
            foodKind.append("주점")


        }
        
        
    }
    
    @IBAction func changelessThanTenThousandWonColor(_ sender: UIButton) {
        lessThanTenThousandWonButtonTappedCount += 1

        if(lessThanTenThousandWonButtonTappedCount % 2 == 0) {
            lessThanTenThousandWonButton.setImage(UIImage(named: "ic_lessThanTenThousandWon_gray"), for: .normal)
            if let index = prices.firstIndex(of: "0"){
                prices.remove(at: index)
            }
        } else {
            lessThanTenThousandWonButton.setImage(UIImage(named: "ic_lessThanTenThousandWon_orange"), for: .normal)
//            prices.insert("0", at: prices.endIndex - 1)
            prices.append("0")

        }
    }
    @IBAction func changeTenThousandWonRangeColor(_ sender: UIButton) {
        tenThousandWonRangeButtonTappedCount += 1

        if(tenThousandWonRangeButtonTappedCount % 2 == 0) {
            tenThousandWonRangeButton.setImage(UIImage(named: "ic_tenThousandWonRange_gray"), for: .normal)
            if let index = prices.firstIndex(of: "1"){
                prices.remove(at: index)
            }
        } else {
            tenThousandWonRangeButton.setImage(UIImage(named: "ic_tenThousandWonRange_orange"), for: .normal)
//            prices.insert("1", at: prices.endIndex - 1)
            prices.append("1")


        }
    }
    @IBAction func changetwentyThousandWonRangeColor(_ sender: UIButton) {
        twentyThousandWonRangeButtonTappedCount += 1

        if(twentyThousandWonRangeButtonTappedCount % 2 == 0) {
            twentyThousandWonRangeButton.setImage(UIImage(named: "ic_twentyThousandWonRange_gray"), for: .normal)
            if let index = prices.firstIndex(of: "2"){
                prices.remove(at: index)
            }
        } else {
            twentyThousandWonRangeButton.setImage(UIImage(named: "ic_twentyThousandWonRange_orange"), for: .normal)
//            prices.insert("2", at: prices.endIndex - 1)
            prices.append("2")


        }
    }
    @IBAction func changeThirtyThousandWonRangeColor(_ sender: UIButton) {
        thirtyThousandWonRangeButtonTappedCount += 1

        if(thirtyThousandWonRangeButtonTappedCount % 2 == 0) {
            thirtyThousandWonRangeButton.setImage(UIImage(named: "ic_thirtyThousandWonRange_gray"), for: .normal)
            if let index = prices.firstIndex(of: "3"){
                prices.remove(at: index)
            }
        } else {
            thirtyThousandWonRangeButton.setImage(UIImage(named: "ic_thirtyThousandWonRange_orange"), for: .normal)
//            prices.insert("3", at: prices.endIndex - 1)
            prices.append("3")


        }
    }
    
    
    @IBAction func changeParkingAvailableColor(_ sender: UIButton) {
        NoParkingAvailableButton.setImage(UIImage(named: "ic_dontcare_gray.png"), for: .normal)
        
        ParkingAvailableButton.setImage(UIImage(named: "ic_possiblePlace_orange.png"), for: .normal)
        carParking = "상관없음"

    }
    
    @IBAction func changeNoParkingAvailableColor(_ sender: UIButton) {
        
        NoParkingAvailableButton.setImage(UIImage(named: "ic_dontcare_orange.png"), for: .normal)
        ParkingAvailableButton.setImage(UIImage(named: "ic_possiblePlace_gray.png"), for: .normal)
        carParking = "가능"


    }
    
    @IBAction func setFilter(_ sender: UIButton) {
        
    self.filterPopUpDelegate.pressedDismissFilterButton()
        self.dismiss(animated: false, completion: nil)
    }
}

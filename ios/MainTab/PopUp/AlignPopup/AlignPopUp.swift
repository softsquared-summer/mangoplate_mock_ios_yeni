//
//  AlignPopup.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class AlignPopUp: BaseViewController {
    var alignPopUpDelegate: AlignPopUpDelegate!
    
    @IBOutlet weak var orderOfRating: UIButton!
    @IBOutlet weak var orderOfReview: UIButton!
    @IBOutlet weak var orderOfDistance: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func pressedRatingDismiss(_ sender: UIButton) {
        orderOfRating.setTitleColor(.orange, for: .normal)
        self.alignPopUpDelegate.pressedDismissRatingButton()
               self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func pressedReviewDismiss(_ sender: UIButton) {
        orderOfReview.setTitleColor(.orange, for: .normal)
        self.alignPopUpDelegate.pressedDismissReviewButton()
               self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func pressedDistanceDismiss(_ sender: UIButton) {
        orderOfDistance.setTitleColor(.orange, for: .normal)
        self.alignPopUpDelegate.pressedDismissDistanceButton()
               self.dismiss(animated: false, completion: nil)
    }
    
    
    
    @IBAction func pressedLocationDismiss(_ sender: UIButton) {

        self.dismiss(animated: false, completion: nil)
    }
    //아래로 가는 버튼 누르면 그냥 내려지기만 하고
    //평점순 누르면 평점순 글씨가 주황색으로 바뀌고 findingGoodRestaurantViewController의 alignButton 텍스트가 평점순으로 바뀌도록 --리뷰순, 거리순에도 마찬가지로 적용
}

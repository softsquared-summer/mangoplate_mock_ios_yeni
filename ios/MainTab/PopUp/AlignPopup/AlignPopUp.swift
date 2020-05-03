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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }//버튼 태그에 따라 색 지정하면 되지 않나 근데 어떤 버튼이 마지막으로 선택되고 dismiss된지 알아야 지정 할 수 있는거 아닌가
    @IBAction func pressedRatingDismiss(_ sender: UIButton) {
        
        orderOfRating.setTitleColor(.orange, for: .normal)
        orderOfReview.setTitleColor(.black, for: .normal)
        orderOfDistance.setTitleColor(.black, for: .normal)

        self.alignPopUpDelegate.pressedDismissRatingButton()
               self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func pressedReviewDismiss(_ sender: UIButton) {
        orderOfRating.setTitleColor(.black, for: .normal)
        orderOfReview.setTitleColor(.orange, for: .normal)
        orderOfDistance.setTitleColor(.black, for: .normal)

        self.alignPopUpDelegate.pressedDismissReviewButton()

               self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func pressedDistanceDismiss(_ sender: UIButton) {
        orderOfRating.setTitleColor(.black, for: .normal)
        orderOfReview.setTitleColor(.black, for: .normal)
        orderOfDistance.setTitleColor(.orange, for: .normal)
     
//        orderOfRating.setTitleColor(.black, for: .normal)
//        orderOfReview.setTitleColor(.black, for: .normal)
//        orderOfDistance.setTitleColor(.orange, for: .normal)
        self.alignPopUpDelegate.pressedDismissDistanceButton()

               self.dismiss(animated: false, completion: nil)
    }
    
    
    
    @IBAction func pressedAlignDismiss(_ sender: UIButton) {

        self.dismiss(animated: false, completion: nil)
    }
    //아래로 가는 버튼 누르면 그냥 내려지기만 하고
    //평점순 누르면 평점순 글씨가 주황색으로 바뀌고 findingGoodRestaurantViewController의 alignButton 텍스트가 평점순으로 바뀌도록 --리뷰순, 거리순에도 마찬가지로 적용
}

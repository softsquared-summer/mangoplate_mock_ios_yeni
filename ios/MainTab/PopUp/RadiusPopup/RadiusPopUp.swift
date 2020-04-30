//
//  RadiusPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import UIKit

class RadiusPopUp: BaseViewController {
    var radiusPopUpDelegate: RadiusPopUpDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func pressedRadiusDismiss(_ sender: UIButton) {
            self.radiusPopUpDelegate.pressedDismissRadiusButton()
            self.dismiss(animated: false, completion: nil)

        self.dismiss(animated: false, completion: nil)
    }
}

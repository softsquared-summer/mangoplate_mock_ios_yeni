//
//  FilterPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FilterPopUp: BaseViewController {
    var filterPopUpDelegate: FilterPopUpDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedFilterDismiss(_ sender: UIButton) {
        self.filterPopUpDelegate.pressedDismissFilterButton()
        self.dismiss(animated: false, completion: nil)
    }
}

//
//  EatDealViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EatDealViewController: UIViewController {
    
    unowned var dataManager: EatDealDataManager {
        get {
            return EatDealDataManager()
        }
    }
    
    
    @IBOutlet weak var eatDealFirstImageView: UIImageView!
    @IBOutlet weak var eatDealFirstPriceLabel: UILabel!
    
    @IBOutlet weak var eatDealFirstTitleLabel: UILabel!
    
    @IBOutlet weak var eatDealFirstItemLabel: UILabel!
    @IBOutlet weak var eatDealSecondImageView: UIImageView!
    @IBOutlet weak var eatDealSecondPriceLabel: UILabel!
    
    @IBOutlet weak var eatDealSecondTitleLabel: UILabel!
    
    @IBOutlet weak var eatDealSecondItemLabel: UILabel!
    @IBOutlet weak var eatDealThirdImageView: UIImageView!
    @IBOutlet weak var eatDealThirdPriceLabel: UILabel!
    
    @IBOutlet weak var eatDealThirdItemLabel: UILabel!
    @IBOutlet weak var eatDealThirdTitleLabel: UILabel!
    
    @IBOutlet weak var eatDealThirdSoldOutLabel: UILabel!
    
    
    @IBOutlet weak var eatDealFourthImageView: UIImageView!
    
    @IBOutlet weak var eatDealFourthPriceLabel: UILabel!
    
    @IBOutlet weak var eatDealFourthTitleLabel: UILabel!
    
    @IBOutlet weak var eatDealFourthItemLabel: UILabel!
    @IBOutlet weak var eatDealFifthImageView: UIImageView!
    @IBOutlet weak var eatDealFifthPriceLabel: UILabel!
    
    @IBOutlet weak var eatDealFifthTitleLabel: UILabel!
    
    @IBOutlet weak var eatDealFifthItemLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.getEatDealList(self)
        // Do any additional setup after loading the view.
    }

    @IBAction func presentSelectRegion(_ sender: UIButton) {
        
        let selectRegionViewController: UINavigationController = UINavigationController(rootViewController: SelectRegionViewController())
               selectRegionViewController.modalPresentationStyle = .fullScreen

               self.present(selectRegionViewController, animated: true, completion: nil)
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

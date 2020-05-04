//
//  PurchasedEatDealViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class PurchasedEatDealViewController: UIViewController {

    @IBOutlet weak var goToSeeEatDeal: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

         var backbutton = UIButton(type: .custom)
                backbutton.setImage(UIImage(named: "ic_left_arrow_orange.png"), for: .normal) // Image can be downloaded from here below link
                backbutton.setTitle("구매한 EAT딜", for: .normal)
                backbutton.tintColor = .orange
        //        backbutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor

                backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)

                self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
      



                
                
    }
            
           @objc func backAction(_ sender: UIButton) {
              let _ = self.dismiss(animated: true, completion: nil)
           }
    
    
    @IBAction func presentEatDealVC(_ sender: UIButton) {
        let linkEatDealViewController: UINavigationController = UINavigationController(rootViewController: LinkEatDealViewController())
        linkEatDealViewController.modalPresentationStyle = .fullScreen

        self.present(linkEatDealViewController, animated: true, completion: nil)
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

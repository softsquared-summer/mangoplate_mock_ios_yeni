//
//  NewsAllViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NewsAllViewController: UIViewController {

    @IBOutlet weak var deliciousButton: UIButton!
    @IBOutlet weak var sosoButton: UIButton!
    @IBOutlet weak var notGoodButton: UIButton!
    
    var deliciousButtonTappedCount : Int = 0
    var sosoButtonTappedCount : Int = 0
    var notGoodButtonTappedCount : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedeliciousButtonColor(_ sender: UIButton) {
    deliciousButtonTappedCount += 1

    if(deliciousButtonTappedCount % 2 == 0) {
        deliciousButton.setImage(UIImage(named: "ic_delicious_gray"), for: .normal)
    } else {
        deliciousButton.setImage(UIImage(named: "ic_delicious_orange"), for: .normal)
        }
    }
    
    @IBAction func changesosoButtonColor(_ sender: UIButton) {
    sosoButtonTappedCount += 1

    if(sosoButtonTappedCount % 2 == 0) {
        sosoButton.setImage(UIImage(named: "ic_soso_gray"), for: .normal)
    } else {
        sosoButton.setImage(UIImage(named: "ic_soso_orange"), for: .normal)
        }
    }
        
    @IBAction func changenotGoodButtonColor(_ sender: UIButton) {
    notGoodButtonTappedCount += 1

    if(notGoodButtonTappedCount % 2 == 0) {
        notGoodButton.setImage(UIImage(named: "ic_notgood_gray"), for: .normal)
    } else {
        notGoodButton.setImage(UIImage(named: "ic_notgood_orange"), for: .normal)
        }
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

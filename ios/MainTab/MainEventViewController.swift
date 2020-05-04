//
//  MainEventViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MainEventViewController: UIViewController {
    unowned var dataManager: LookUpMainEventDataManager {
        get {
            return LookUpMainEventDataManager()
        }
    }


    @IBOutlet weak var mainEventImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getLookUpMainEvent(self)

        // Do any additional setup after loading the view.
    }
   
    


    @IBAction func closeButton(_ sender: UIButton) {
        let mainTabvc = MainTabViewController() //change this to your class name
        mainTabvc.modalPresentationStyle = .fullScreen

        UIApplication.shared.delegate?.window!!.rootViewController?.present(mainTabvc, animated: true, completion: nil)

        self.present(mainTabvc, animated: true, completion: nil)
        
    }
    @IBAction func neverSeeAgainButton(_ sender: UIButton) {
        let mainTabvc = MainTabViewController() //change this to your class name
        mainTabvc.modalPresentationStyle = .fullScreen

        UIApplication.shared.delegate?.window!!.rootViewController?.present(mainTabvc, animated: true, completion: nil)

        self.present(mainTabvc, animated: true, completion: nil)
        
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

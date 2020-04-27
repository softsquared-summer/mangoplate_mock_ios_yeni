//
//  FiveMainViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FiveMainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
//    let imageData = ["threeSectionFirstITem.png", "threeSectionSecondITem.png", "FiveSectionFirstITem.png", "FiveSectionSecondITem.png","FiveSectionThreeITem.png","FiveSectionFourthITem.png", "SixSectionFirstITem.png"]
    let titleData = [".","이벤트","구매한 EAT딜","EAT딜 입고알림","타임라인","가고싶다","마이리스트","북마크","내가 등록한 식당", "설정"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib1 = UINib(nibName: "MyTableViewCellNibFile", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "FiveMainTableViewCell1")
        let nib2 = UINib(nibName: "MyTableViewCellNibFile", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "FiveMainTableViewCell2")
        let nib3 = UINib(nibName: "MyTableViewCellNibFile", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "FiveMainTableViewCell3")
        // Do any additional setup after loading the view.
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
extension FiveMainViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else if section == 1{
            return 1
        } else if section == 2{
            return 2
        } else if section == 3{
            return 1
        } else if section == 4{
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
//            let SimpleTableIdentifier:NSString = "FiveMainTableViewCell1"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell1", for: indexPath) as? FiveMainTableViewCell
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[0]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
            }
            return cell
        } else if indexPath.section == 1{
//           let SimpleTableIdentifier:NSString = "FiveMainTableViewCell2"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell2", for: indexPath) as? FiveMainTableViewCell
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[1]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
            return cell

    } else if indexPath.section == 2{
//           let SimpleTableIdentifier:NSString = "FiveMainTableViewCell2"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell2", for: indexPath) as? FiveMainTableViewCell
            
            cell.commonInit("Item\(indexPath.item)", title: titleData[indexPath.item])
            
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[2]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
//            cell.FiveMainTableViewCell2ImageView.image = UIImage(named: "threeSectionFirstITem")
            return cell

    } else if indexPath.section == 3{
//           let SimpleTableIdentifier:NSString = "FiveMainTableViewCell3"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell3", for: indexPath) as? FiveMainTableViewCell
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[3]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
            return cell

    } else if indexPath.section == 4{
//           let SimpleTableIdentifier:NSString = "FiveMainTableViewCell2"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell2", for: indexPath) as? FiveMainTableViewCell
            cell.commonInit("Item\(indexPath.item)", title: titleData[indexPath.item])
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[4]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
            cell.FiveMainTableViewCell2ImageView.image = UIImage(named: "FiveSectionFirstITem")
            return cell

    } else{
//           let SimpleTableIdentifier:NSString = "FiveMainTableViewCell2"
            var cell: FiveMainTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "FiveMainTableViewCell2", for: indexPath) as? FiveMainTableViewCell
            cell.commonInit("Item\(indexPath.item)", title: titleData[indexPath.item])
            if(cell == nil){
                let nib: [FiveMainTableViewCell] = Bundle.main.loadNibNamed("FiveMainTableViewCell", owner: self, options: nil) as! [FiveMainTableViewCell]
                cell = nib[4]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
            cell.FiveMainTableViewCell2ImageView.image = UIImage(named: "SixSectionFirstITem")
            return cell

    }
    
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 150
        } else if indexPath.section == 1{
            return 70
        } else if indexPath.section == 2{
            return 70

        } else if indexPath.section == 3{
            return 100

        } else if indexPath.section == 4{
            return 70

        } else{
            return 70

        }
    }
    
}

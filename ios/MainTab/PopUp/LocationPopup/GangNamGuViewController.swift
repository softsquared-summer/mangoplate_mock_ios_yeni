//
//  GangNamGuViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class GangNamGuViewController: UIViewController {
    unowned var dataManager: DistinctDataManager  {
        get {
            return DistinctDataManager ()
        }
    }
    
   var dongs : [String] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private func setupFlowLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 1
            flowLayout.minimumLineSpacing = 1
            
            let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.99 , height: halfWidth * 0.3)
            self.collectionView.collectionViewLayout = flowLayout
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getGangNamGuRegionList(self)
        
        
        // Do any additional setup after loading the view.
    }

    func setDongs(){
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.register(UINib(nibName: "GangNamGuCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "GangNamGuCollectionViewCell")
           setupFlowLayout()
           print("dongs: \(dongs.count)")
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pressedSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

    }
    
    @IBAction func clearSelectedRegion(_ sender: UIButton) {
        
    }//셀들 색 회색으로 변하게
    

}
extension GangNamGuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dongs.count
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GangNamGuCollectionViewCell", for: indexPath) as? GangNamGuCollectionViewCell else {
            return GangNamGuCollectionViewCell()
            
        }
        
        
    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.dongInGangNamGuLabel.text = self.dongs[indexPath.row]
        
        
        
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)

       if let index = indexPath {
          print("Got clicked on index: \(index)!")
       }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: 150, height: 20)

    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.borderColor = UIColor.orange.cgColor
//       
//    }
}

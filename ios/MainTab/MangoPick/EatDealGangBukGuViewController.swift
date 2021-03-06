//
//  EatDealGangBukGuViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EatDealGangBukGuViewController: UIViewController {

    unowned var dataManager: DistinctDataManager  {
           get {
               return DistinctDataManager ()
           }
       }
    var dongs:[String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0) //50으로 탭바 밑에 있게 설정
            flowLayout.minimumInteritemSpacing = 1
            flowLayout.minimumLineSpacing = 1
            
            let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.99 , height: halfWidth * 0.3) // height줄여서 위아래 간격 좁게,width 늘려서 옆 간격 좁게 ( 다만 1로 주면 한 행에 셀 한개 있게 돼서 최대한 크게)
            self.collectionView.collectionViewLayout = flowLayout
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getEatDealGangBukGuRegionList(self)

        // Do any additional setup after loading the view.
    }
    func setDongs(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "EatDealGangBukGuCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "EatDealGangBukGuCollectionViewCell")
        setupFlowLayout()
        
        
    }


    @IBAction func pressedSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

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

extension EatDealGangBukGuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dongs.count
        //식당 갯수로 바꿔야함
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EatDealGangBukGuCollectionViewCell", for: indexPath) as? EatDealGangBukGuCollectionViewCell else {
            return EatDealGangBukGuCollectionViewCell()
            
        }
        
        
    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
         cell.eatDealDongInGangBukGuLabel.text = self.dongs[indexPath.row]
    

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

      return CGSize(width: 170, height: 110)

    }
}

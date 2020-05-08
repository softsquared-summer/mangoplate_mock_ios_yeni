//
//  NearViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NearViewController: UIViewController {
    
    unowned var dataManager: NearRegionListDataManager  {
         get {
             return NearRegionListDataManager ()
         }
     }
     
    var dongs : [String] = []

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

        dataManager.getNearRegionList(self)


        // Do any additional setup after loading the view.
    }
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
    
    @IBAction func pressedSettingLocation(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)

    }
    
    func setDongs(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "NearCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "NearCollectionViewCell")
        setupFlowLayout()
        print("dongs: \(dongs.count)")
    }
}

extension NearViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dongs.count
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearCollectionViewCell", for: indexPath) as? NearCollectionViewCell else {
            return NearCollectionViewCell()
            
        }
        
        
    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.nearLabel.text = self.dongs[indexPath.row]
        
        
        
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


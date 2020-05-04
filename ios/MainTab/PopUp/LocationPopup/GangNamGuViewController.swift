//
//  GangNamGuViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class GangNamGuViewController: UIViewController {
    
    private var dongs: [String] {
        var dongs:[String] = ["강남역", "가로수길", "강동구"]
           
           return dongs
       }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private func setupFlowLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets.zero
            flowLayout.minimumInteritemSpacing = 5
            flowLayout.minimumLineSpacing = 5
            
            let halfWidth = UIScreen.main.bounds.width / 2
            flowLayout.itemSize = CGSize(width: halfWidth * 0.8 , height: halfWidth * 0.9)
            self.collectionView.collectionViewLayout = flowLayout
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
                   collectionView.dataSource = self
                   collectionView.register(UINib(nibName: "GangNamGuCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "GangNamGuCollectionViewCell")
                   setupFlowLayout()
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
extension GangNamGuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //식당 갯수로 바꿔야함
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GangNamGuCollectionViewCell", for: indexPath) as? GangNamGuCollectionViewCell else {
            return GangNamGuCollectionViewCell()
        }
    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
    
        cell.dongInGangNamGuButton.setTitle(dongs[indexPath.row], for: .normal)
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

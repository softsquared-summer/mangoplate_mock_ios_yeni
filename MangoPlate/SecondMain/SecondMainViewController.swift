//
//  SecondMainViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/26.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SecondMainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    let secondCollectionView: UICollectionView = {
//
//        let flowLayout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = UIColor.red
//
//        return collectionView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
//        NSLayoutConstraint.activate([
//        secondCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//        secondCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
//        secondCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
//        secondCollectionView.heightAnchor.constraint(equalToConstant: 300)
//
//        ])
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
//
//        let alarmCollectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
//        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        // Do any additional setup after loading the view.
//        setupMenuBar()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
//
//    let menuBar : MenuBar = {
//        let mb = MenuBar()
//        return mb
//    }()
//
//    private func setupMenuBar(){
//        view.addSubview(menuBar)
//        menuBar.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .bottom,relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .left ,relatedBy: .equal, toItem: self.view, attribute: .left , multiplier: 1, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .right ,relatedBy: .equal, toItem: self.view, attribute: .right , multiplier: 1, constant: 0))
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MenuViewController.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-10.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import SnapKit
import IBAnimatable

class MenuViewController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let animCell = AnimatableCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        
        for _ in 0...10
        {
            collectionView.addSubview(animCell)
        }
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints({ (make) -> Void in make.edges.equalToSuperview()
        })
    }
}

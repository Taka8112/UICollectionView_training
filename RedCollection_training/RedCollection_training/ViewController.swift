//
//  ViewController.swift
//  RedCollection_training
//
//  Created by Takahiro Noguchi on 2016/05/27.
//  Copyright © 2016年 Takahiro Noguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource  , UICollectionViewDelegate{
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Vertical // Cellのスクロール方向
//        flowLayout.minimumInteritemSpacing = 5.0 //Cellの間隔
//        flowLayout.minimumLineSpacing = 5.0 //セクションとアイテムのマージン
        flowLayout.itemSize = CGSizeMake(100, 100) //Cellの大きさ
        
        // Cellのマージン.
        flowLayout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        // セクション毎のヘッダーサイズ.
        flowLayout.headerReferenceSize = CGSizeMake(100,100)
        
        // コレクションビュー作成
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
//        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomUICollectionViewCell
        cell.textLabel?.text = indexPath.row.description
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
}


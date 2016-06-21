import UIKit
import XCPlayground

//Data
let data = [
     /*section one */ [1,2,3],
    /*section two */  [1,2,3]
]


//Cell Configuration
let config: (UICollectionViewCell, Int) -> Void = { cell, item in
    cell.backgroundColor = .lightGrayColor()
}

//Layout Configuration
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .Vertical
layout.sectionInset = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)






//Playground Page Setup
let collectionViewController = CollectionViewController(data: data, configureCell: config, layout: layout)
let nav = UINavigationController(rootViewController: collectionViewController)
//collectionViewController.onTapItem = { indexPath in
//    print(indexPath)
//}
XCPlaygroundPage.currentPage.liveView = nav

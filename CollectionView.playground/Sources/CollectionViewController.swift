import UIKit

public class CollectionViewController<T>: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate, TransitionAnimatorProtocol, UINavigationControllerDelegate {
    
    public var data: [[T]]
    public var configureCell: (UICollectionViewCell, T) -> ()
    public var onTapItem: ((NSIndexPath) -> Void)?
    
    lazy var animator = TransitionAnimator()
    
    public init(data: [[T]], configureCell:(UICollectionViewCell, T) -> (), layout: UICollectionViewFlowLayout) {
        
        self.data = data
        self.configureCell = configureCell
        super.init(collectionViewLayout: layout)
        collectionView?.backgroundColor = .whiteColor()
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseID")
    }
    
    public override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return data.count
    }
    public override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    var numberOfColumns:CGFloat = 2
    let ratio: CGFloat = 0.4
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSizeZero }
        
        let contentInsets = collectionView.contentInset.left + collectionView.contentInset.right
        let sectionInset = layout.sectionInset.left + layout.sectionInset.right
        let combinedInsets = contentInsets + sectionInset
        
        let width = collectionView.bounds.size.width - combinedInsets
        let height = collectionView.bounds.height * ratio
       
        return CGSize(width: width, height: height)
    }
    
    public override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("reuseID", forIndexPath: indexPath)
        
        configureCell(cell, data[indexPath.section][indexPath.item])
        return cell
    }
    
    public override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        originatingView = collectionView.cellForItemAtIndexPath(indexPath)
        navigationController?.delegate = self
        if let onTapHandler = onTapItem {
            onTapHandler(indexPath)
        } else {
            let destination = DetailViewController()
            destination.view.backgroundColor = .whiteColor()
            destination.transitioningDelegate = self
            
            navigationController?.presentViewController(destination, animated: true, completion: nil)
            
        }
    }
   
    //MARK: Transitioning
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    var originatingView: UIView?
    
    public func viewForTransition(presenting: Bool) -> UIView {
        if let view = originatingView {
            return view
        } else {
            return view
        }
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}
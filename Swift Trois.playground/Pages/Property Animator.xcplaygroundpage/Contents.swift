import UIKit
import XCPlayground

let weddingWireLogo = #imageLiteral(resourceName: "weddingwire-logo-circle-64_2x copy.png")
let radians = Measurement(value: -90, unit: UnitAngle.degrees).converted(to: UnitAngle.radians)
let float = radians.value
class PanView: UIView {
    
    var colorChange: UIViewPropertyAnimator?
    let imageView: UIImageView
    override init(frame: CGRect) {
        // set up imageView
        imageView = UIImageView(frame: frame.insetBy(dx: 75, dy: 75))
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "weddingwire-logo-circle-64_2x copy.png")
        super.init(frame: frame)
        // make background color white
        backgroundColor = .white()
        // add imageView to self
        addSubview(imageView)
        // set up UIViewPropertyAnimator
        colorChange = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.5) {
            self.backgroundColor = .cyan()
            
            //Measurement <Degrees> to radians
            let radians = Measurement(value: 180, unit: UnitAngle.degrees).converted(to: UnitAngle.radians)
            let rotate = CATransform3DMakeRotation(CGFloat(radians.value), 30, 10, 30)
            self.imageView.layer.transform = rotate
        }
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle))
        addGestureRecognizer(panGestureRecognizer)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handle(pan recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        let translatedCenterY = center.y + translation.y
        let progress = translatedCenterY / bounds.size.height
        colorChange?.fractionComplete = progress
    }
}


let view = PanView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
XCPlaygroundPage.currentPage.liveView = view
view.colorChange.unsafelyUnwrapped

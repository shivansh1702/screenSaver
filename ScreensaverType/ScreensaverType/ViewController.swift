import UIKit

class ViewController: UIViewController {

    let screenSaver = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSaver.translatesAutoresizingMaskIntoConstraints = false
        screenSaver.backgroundColor = .yellow
        view.addSubview(screenSaver)
        animate()
    }

    func animate(){
        let animation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath()
       
        let screenBounds = UIScreen.main.bounds
        path.move(to: CGPoint(x: screenBounds.midX, y: screenBounds.minY)) // Start at the top center
        path.addLine(to: CGPoint(x: screenBounds.maxX, y: screenBounds.minY)) // Move to the top right
        path.addLine(to: CGPoint(x: screenBounds.maxX, y: screenBounds.maxY)) // Move down the right edge
        path.addLine(to: CGPoint(x: screenBounds.midX, y: screenBounds.maxY)) // Move to the bottom center
        path.addLine(to: CGPoint(x: screenBounds.minX, y: screenBounds.maxY)) // Move up the left edge
        path.addLine(to: CGPoint(x: screenBounds.minX, y: screenBounds.minY))
        
        animation.path = path
        animation.duration = 4
        animation.beginTime = CACurrentMediaTime() + 0.3
        animation.autoreverses = false
        animation.repeatCount = .infinity
        
        self.screenSaver.layer.add(animation, forKey: "position")
    }
    
}


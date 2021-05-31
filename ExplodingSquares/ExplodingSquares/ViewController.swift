//
//  ViewController.swift
//  ExplodingSquares
//
//  Created by Pedro Henrique on 31/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var board: UIView! {
        didSet {
            animator = UIDynamicAnimator(referenceView: board)
            
            
            behavior = SquareBehavior()
            animator?.addBehavior(behavior!)
        }
    }
    
    private var animator: UIDynamicAnimator?
    private var behavior: SquareBehavior?
    private var squares = [UIView]()
    
    
    @IBAction func onSquare(_ sender: UIButton) {
        var frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 20))
        let x = arc4random() % UInt32(board.bounds.size.width)
        frame.origin.x = CGFloat(x)
        
        let square = UIView(frame: frame)
        square.backgroundColor = randomColor()
        board.addSubview(square)
        squares.append(square)
        behavior?.addItem(square)

    }
    
    @IBAction func onExplode(_ sender: UIButton) {
        guard squares.count > 0 else { return }
        
        squares.forEach({behavior?.removeItem($0)})
        
        UIView.animate(
            withDuration: 1) {
            for sq in self.squares {
                let x = arc4random() % UInt32(self.board.bounds.size.width * 5)
                let y = self.board.bounds.size.height
                sq.center = CGPoint(x: CGFloat(x), y: -y)
                
                
            }
        } completion: { (finished) in
            self.squares.forEach({$0.removeFromSuperview()})
            self.squares.removeAll()
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func randomColor() -> UIColor {
        let r = CGFloat(arc4random() % 255) / 255
        let g = CGFloat(arc4random() % 255) / 255
        let b = CGFloat(arc4random() % 255) / 255
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }


}


//
//  ViewController.swift
//  AnimacaoBasica
//
//  Created by Pedro Henrique on 31/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var square: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
            square.isUserInteractionEnabled = true
            square.addGestureRecognizer(tap)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(
            withDuration: 6,
            delay: 2,
            options: [.curveEaseInOut, .autoreverse, .allowUserInteraction, .allowAnimatedContent]) {
            self.square.center = CGPoint(x: 0, y: 0)
        } completion: { (finished) in
            self.square.center = self.view.center
        }

    }
    
    
    @objc func onTap(_ sender: UITapGestureRecognizer) {
        UIView.transition(
            with: square,
            duration: 4,
            options: [.curveLinear, .transitionCurlUp, .allowUserInteraction, .allowAnimatedContent]) {
            self.square.backgroundColor = UIColor.green
        } completion: { (finished) in
            
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


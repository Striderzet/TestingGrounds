//
//  PannableViewController.swift
//  Testing Grounds (UIKit)
//
//  Created by Tony Buckner on 7/5/21.
//

import Foundation
import UIKit

class PannableViewController: UIViewController { 
    
    //Gesture recognizer and position values
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the gesture recognizer
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
        
    }
    
    //MARK: - Full gesture action method
    @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        
        let translation = panGesture.translation(in: view)
        
        if panGesture.state == .began {
            
          originalPosition = view.center
          currentPositionTouched = panGesture.location(in: view)
            
        } else if panGesture.state == .changed {
            
            view.frame.origin = CGPoint(x: translation.x, y: translation.y)
            
        } else if panGesture.state == .ended {
            
          let velocity = panGesture.velocity(in: view)

          if velocity.y >= 1500 {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.view.frame.origin = CGPoint(x: self.view.frame.origin.x, y: self.view.frame.size.height)
                
              }, completion: { (isCompleted) in
                
                if isCompleted {
                  self.dismiss(animated: false, completion: nil)
                }
                
            })
          } else {
            
            UIView.animate(withDuration: 0.2, animations: {
              self.view.center = self.originalPosition!
            })
            
          }
            
        }
        
      }
    
}

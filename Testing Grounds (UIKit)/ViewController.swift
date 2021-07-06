//
//  ViewController.swift
//  Testing Grounds (UIKit)
//
//  Created by Tony Buckner on 7/5/21.
//
// MARK: - The 2/3 modal will possibly need aa external gesture recognizer to allow the swiping actions.

import UIKit

final class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func presentModalVC(_ sender: Any) {
        
        //Invoke the methods to present the 1/4 modal view in the same view, without that view shrinking in the background.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "ModalViewController")

        pvc.modalPresentationStyle = .custom
        pvc.transitioningDelegate = self
        //pvc.view.backgroundColor = .red //we don't need to set this, but we will keep it for reference

        present(pvc, animated: true)
        
    }
    
    //MARK: - Presentation controller method
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
    }
    
}

//MARK: - Presentation controller for half size
class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: 0, y: bounds.height / 4, width: bounds.width, height: bounds.height)
    }
}


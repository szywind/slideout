//
//  SideMenuViewController.swift
//  slideout
//
//  Created by Cloudream on 26/03/2018.
//  Copyright © 2018 GSS. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet var gestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var initCenter: CGPoint?
    var lasttranslation: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(showSideMenu), name: NSNotification.Name(rawValue: "showSideMenu"), object: nil)
        sideMenuConstraint.constant = -260
        initCenter = gestureRecognizer.view?.superview?.center
        print("initCenter: ", initCenter?.x, initCenter?.y)
    }

    
    // https://www.youtube.com/watch?v=ISxe1Fq-tTw&index=10&list=PLRD2R20xq-46XBsgacSi4FEhIlRyRpJGo
    // https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures/handling_pan_gestures
    @IBAction func onPanPerformed(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view.superview).x
        let curCenter = gestureRecognizer.view!.superview?.center
        print("curCenter: ", curCenter?.x, curCenter?.y)
        if sender.state == .began || sender.state == .changed {
        
            if translation > 0 { // swipe right
                if (curCenter?.x)! < (initCenter?.x)! - self.sideMenuConstraint.constant {
                    lasttranslation = translation
                    UIView.animate(withDuration: 0.1, animations: {
//                        self.sideMenuConstraint.constant = min(self.sideMenuConstraint.constant + translation / 10, 0)
////                        self.sideMenuConstraint.constant += translation / 5
//                        self.view.layoutIfNeeded()
//
                        self.gestureRecognizer.view!.superview?.center = CGPoint(x: (curCenter?.x)! + translation, y: (curCenter?.y)!)
                        self.gestureRecognizer.setTranslation(CGPoint.zero, in: self.view.superview)
                    })
                }
            } else { // swipe leftr
                if (curCenter?.x)! > (initCenter?.x)! - 260 - self.sideMenuConstraint.constant {
                    lasttranslation = translation
                    UIView.animate(withDuration: 0.1, animations: {
//                        self.sideMenuConstraint.constant = min(self.sideMenuConstraint.constant + translation / 10, 0)
////                        self.sideMenuConstraint.constant += translation / 5
//                        self.view.layoutIfNeeded()
                        
                        self.gestureRecognizer.view?.superview?.center = CGPoint(x: (curCenter?.x)! + translation, y: (curCenter?.y)!)
                        self.gestureRecognizer.setTranslation(CGPoint.zero, in: self.view.superview)

                    })

                }
            }
        } else if sender.state == .ended {
            
//            if sideMenuConstraint.constant < -200 {
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.sideMenuConstraint.constant = -260
//                    self.view.layoutIfNeeded()
//                })
//            } else {
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.sideMenuConstraint.constant = 0
//                    self.view.layoutIfNeeded()
//                })
//            }
            
            
            self.gestureRecognizer.view?.superview!.center = self.initCenter!
            self.gestureRecognizer.setTranslation(CGPoint.zero, in: self.view.superview)
            
            if lasttranslation > 0 { // swipe right
                UIView.animate(withDuration: 0.1, animations: {
//                    self.gestureRecognizer.view?.superview!.center = CGPoint(x: (self.initCenter?.x)! + 260, y: (self.initCenter?.y)!)
//                    self.gestureRecognizer.setTranslation(CGPoint.zero, in: self.view.superview)
                    self.sideMenuConstraint.constant = 0
//                    self.gestureRecognizer.view?.superview!.center.x = (self.initCenter?.x)! + 260
                })
            } else { // swipe left
                UIView.animate(withDuration: 0.1, animations: {
//                    self.gestureRecognizer.view?.superview!.center = self.initCenter!
//                    self.gestureRecognizer.setTranslation(CGPoint.zero, in: self.view.superview)
                    self.sideMenuConstraint.constant = -260
//                    self.gestureRecognizer.view?.superview!.center.x = (self.initCenter?.x)!

                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showSideMenu() {
//        if sideMenuConstraint.constant < 0 {
//            sideMenuConstraint.constant = 0
//        } else {
//            sideMenuConstraint.constant = -260
//        }
        print("show side menu")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

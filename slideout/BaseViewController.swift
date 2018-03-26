//
//  BaseViewController.swift
//  slideout
//
//  Created by Cloudream on 26/03/2018.
//  Copyright © 2018 GSS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let navBtn = UIBarButtonItem(image: UIImage(named: "first"), style: .plain, target: self, action: #selector(showSideMenu))
        navigationItem.leftBarButtonItem = navBtn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showSideMenu() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showSideMenu"), object: nil)
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

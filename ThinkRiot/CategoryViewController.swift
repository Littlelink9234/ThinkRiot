//
//  ViewController.swift
//  ThinkRiot
//
//  Created by MacBookPro on 7/29/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import UIKit
import PasscodeLock

class CategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIImageview.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view, typically from a nib.
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Authenticate", style: .plain, target: self, action: #selector(setAuthentication))
    }

    @IBAction func setAuth(_ sender: Any) {
        print("did this work?")
//        let configuration = PasscodeLockConfiguration()
//        
//        let passcodeViewController = PasscodeLockViewController(state: .SetPasscode, configuration: configuration)
//        
//        present(passcodeViewController, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


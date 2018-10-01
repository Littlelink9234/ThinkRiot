//
//  ProductsViewController.swift
//  ThinkRiot
//
//  Created by MacBookPro on 8/1/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import UIKit


class ProductsViewController: UIViewController {
    var currentSeats:Int = 20
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var reserveNowButton: UIButton!
    
    // Item properties
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemBrand: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reserveNow(_ reserveNowButton: UIButton) {
        let alert = UIAlertController(title: "Reserve Seat", message: "Are you sure you want to reserve a seat?", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: removeOneSeat)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func removeOneSeat(alert: UIAlertAction!) {
        currentSeats = currentSeats - 1
        print(currentSeats)
        if currentSeats == 0 {
            reserveNowButton.setTitle("Game Full!", for: UIControlState.normal)
            reserveNowButton.isUserInteractionEnabled = false;
            reserveNowButton.backgroundColor = UIColor.darkGray
        }
        seatsLabel.text = "\(currentSeats)"
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "handbags" {
            print("handbags brought me here")
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

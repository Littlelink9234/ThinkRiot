//
//  ToysViewController.swift
//  ThinkRiot
//
//  Created by MacBookPro on 8/5/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import UIKit
import MessageUI

class ToysViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    var currentSeats:Int = 3
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var reserveNowButton: UIButton!
    @IBOutlet weak var timeFrameButton: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    var player = Player(firstName: "Jason", lastName: "Carvalho", balance: 1000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceLabel.text = String(player.balance)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reserveNow(_ reserveNowButton: UIButton) {
        // get the state of the button time frame
        
        
        let alert = UIAlertController(title: "Reserve Seat", message: "Are you sure you want to reserve a seat?", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: removeOneSeat)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func removeOneSeat(alert: UIAlertAction!) {
        if currentSeats == 0 {
            reserveNowButton.setTitle("Game Full!", for: UIControlState.normal)
            reserveNowButton.isUserInteractionEnabled = false;
            reserveNowButton.backgroundColor = UIColor.darkGray
            //sendSMSText(phoneNumber: <#T##String#>)
        }
        currentSeats = currentSeats - 1
        print(currentSeats)
        seatsLabel.text = "\(currentSeats)"
        
        var currentPlayerBalance: Int
        currentPlayerBalance = player.balance - 100
        player.balance = currentPlayerBalance
        balanceLabel.text = String(currentPlayerBalance)
    }
    
    @IBAction func printButtonPressed(_ timeFrameButton: UIButton) {
        print("time button was pressed")
    }
    
    func sendSMSText(phoneNumber: String) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Let's play the game!!"
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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

//
//  FormController.swift
//  ScoutingApp
//
//  Created by Araav Nayak on 9/3/23.
//

import Foundation
import UIKit
import SwiftUI

class FormController: UIViewController {
    
    
    
    
    
    //Autonomous
    var hasPreloadedCargo: Bool? = false
    var visitedChargingStation: Bool? = false
    var exitedCommunity: Bool? = false
    @IBOutlet var autonomousSwitches: [UISwitch]!
    
    //Teleoperated
    var pickedUpFromGround: Bool? = false
    var pickedUpFromDoubleSubstation: Bool? = false
    var pickedUpFromSingleSubstation: Bool? = false
    var noPickup: Bool? = false
    var isShuttleRobot: Bool? = false
    var pickupTippedCones: Bool? = false
    @IBOutlet var teleopSwitches: [UISwitch]!
    
    //Endgame
    var numRobotsOnChargingStation: Int? = 0
    var robotLocation: String? = ""
    var matchOutcome: String? = ""
    var chargingStationStatus: String? = ""
    var matchOutcomeStatus: String? = ""
    var allianceScore: String? = ""
    var oppositionScore: String? = ""
    var numLinks: String? = ""
    var avgCycleTime: String? = ""
    var atLeastThreeInCoopertitionGrid: Bool? = false
    var activationBonus: Bool? = false
    
    
    @IBOutlet var numRobotOptions: [UIButton]!
    @IBOutlet weak var chargingStationSelectBtn: UIButton!
    @IBOutlet var chargingStationOptions: [UIButton]!
    @IBOutlet var matchOutcomeOptions: [UIButton]!
    
    //Postgame
    var speedRating: String? = ""
    var awarenessRating: String? = ""
    var strengthsComment: String? = ""
    var specialCircumstancesComment: String? = ""
    var additionalComments: String? = ""
    
    
    override func viewDidLoad() {
        
        if let inputSwitches = autonomousSwitches {
            for inputSwitch in inputSwitches {
                if inputSwitch != nil {
                    inputSwitch.setOn(false, animated: false)
                }
            }
        }
    
        if let inputSwitches = teleopSwitches {
            for inputSwitch in inputSwitches {
                if inputSwitch != nil {
                    inputSwitch.setOn(false, animated: false)
                }
            }
        }
        
        if let chargingStationOptions2 = chargingStationOptions {
            chargingStationOptions2.forEach { (btn) in
                btn.isHidden = true
                btn.alpha = 0
            }
        }
    
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_ :)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1;
        
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    
    @objc func hideKeyboard(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func preloadedCargoSwitchChanged(_ sender: UISwitch) {
        hasPreloadedCargo = sender.isOn
    }
    
    @IBAction func visitedChargingStationSwitchChanged(_ sender: UISwitch) {
        visitedChargingStation = sender.isOn
    }
    
    @IBAction func exitedCommunitySwitchChanged(_ sender: UISwitch) {
        exitedCommunity = sender.isOn
    }
    
    
    @IBAction func pickupFromGroundSwitchChanged(_ sender: UISwitch) {
        pickedUpFromGround = sender.isOn
    }
    
    
    @IBAction func pickupFromDoubleSubstationChanged(_ sender: UISwitch) {
        pickedUpFromDoubleSubstation = sender.isOn
    }
    
    
    @IBAction func pickupFromSingleSubstationSwitchChanged(_ sender: UISwitch) {
        pickedUpFromSingleSubstation = sender.isOn
    }
    
    
    @IBAction func noPickupSwitchChanged(_ sender: UISwitch) {
        noPickup = sender.isOn
    }
    
    
    @IBAction func isShuttleRobotSwitchChanged(_ sender: UISwitch) {
        isShuttleRobot = sender.isOn
    }
    
    
    @IBAction func pickupTippedConesSwitchChanged(_ sender: UISwitch) {
        pickupTippedCones = sender.isOn
    }
    
    
    
    @IBAction func numRobotsIsZero(_ sender: UIButton) {
        numRobotsOnChargingStation = 0
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsOne(_ sender: UIButton) {
        numRobotsOnChargingStation = 1
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsTwo(_ sender: UIButton) {
        numRobotsOnChargingStation = 2
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsThree(_ sender: UIButton) {
        numRobotsOnChargingStation = 3
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func chargingStationSelectBtnPressed(_ sender: UIButton) {
        chargingStationOptions.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
            }
        }
    }
    
    
    @IBAction func chargingStationOptionSelected(_ sender: UIButton) {
        if let btnLabel = sender.titleLabel?.text {
            print(btnLabel)
            chargingStationOptions.forEach { (btn) in
                UIView.animate(withDuration: 0.7) {
                    btn.isHidden = !btn.isHidden
                    btn.alpha = btn.alpha == 0 ? 1 : 0
                    //btn.layoutIfNeeded()
                }
            }
            chargingStationStatus = (sender.titleLabel?.text)!
            chargingStationSelectBtn.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    
    
    @IBAction func matchOutcomeIsWin(_ sender: UIButton) {
        matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func matchOutcomeIsLoss(_ sender: UIButton) {
        matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func matchOutcomeIsTie(_ sender: UIButton) {
        matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func allianceScoreEntered(_ sender: UITextField) {
        allianceScore = sender.text!
    }
    
    
    @IBAction func numLinksEntered(_ sender: UITextField) {
        numLinks = sender.text!
    }
    
    @IBAction func oppositionScoreEntered(_ sender: UITextField) {
        oppositionScore = sender.text!
    }
    
    @IBAction func avgCycleTimeEntered(_ sender: UITextField) {
        avgCycleTime = sender.text!
    }
    
    
    @IBAction func coopGridRankEntered(_ sender: UISwitch) {
        atLeastThreeInCoopertitionGrid = sender.isOn
    }
    
    
    @IBAction func activationBonusEntered(_ sender: UISwitch) {
        activationBonus = sender.isOn
    }
    
    
    
    
    @IBAction func speedRatingEntered(_ sender: UITextField) {
        speedRating = sender.text!
    }
    
    
    
    @IBAction func awarenessRatingEntered(_ sender: UITextField) {
        awarenessRating = sender.text!
    }
    
    
    @IBAction func strengthsEntered(_ sender: UITextField) {
        strengthsComment = sender.text!
    }
    
    @IBAction func specialCircumstancesUpdated(_ sender: UITextField) {
        specialCircumstancesComment = sender.text!
    }
    
    
    @IBAction func additionalCommentsEntered(_ sender: UITextField) {
        additionalComments = sender.text!
    }
    
    
    @IBAction func submitReportBtnPressed(_ sender: UIButton) {
        //use firebase to store data
        print("Submitted!")
    }
    
    
}



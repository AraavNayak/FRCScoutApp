//
//  FormController.swift
//  ScoutingApp
//
//  Created by Araav Nayak on 9/3/23.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseDatabase

class FormController: UIViewController {
    
    private let database = Database.database().reference() //storing reference to database
    
    //Autonomous
    public static var hasPreloadedCargo: Bool? = false
    public static var visitedChargingStation: Bool? = false
    public static var exitedCommunity: Bool? = false
    @IBOutlet var autonomousSwitches: [UISwitch]!
    public static var autonomousCoopGrid = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
    
    //Teleoperated
    public static var pickedUpFromGround: Bool? = false
    public static var pickedUpFromDoubleSubstation: Bool? = false
    public static var pickedUpFromSingleSubstation: Bool? = false
    public static var noPickup: Bool? = false
    public static var isShuttleRobot: Bool? = false
    public static var pickupTippedCones: Bool? = false
    @IBOutlet var teleopSwitches: [UISwitch]!
    public static var teleOpCoopGrid = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
    
    //Endgame
    public static var numRobotsOnChargingStation: Int? = 0
    //public static var robotLocation: String? = ""
    public static var matchOutcome: String? = ""
    public static var chargingStationStatus: String? = ""
    public static var matchOutcomeStatus: String? = ""
    public static var allianceScore: String? = ""
    public static var oppositionScore: String? = ""
    public static var numLinks: String? = ""
    public static var avgCycleTime: String? = ""
    public static var atLeastThreeInCoopertitionGrid: Bool? = false
    public static var activationBonus: Bool? = false
    
    
    @IBOutlet var numRobotOptions: [UIButton]!
    @IBOutlet weak var chargingStationSelectBtn: UIButton!
    @IBOutlet var chargingStationOptions: [UIButton]!
    @IBOutlet var matchOutcomeOptions: [UIButton]!
    @IBOutlet var endgameSwitches: [UISwitch]!
    
    
    //Postgame
    public static var speedRating: String? = ""
    public static var awarenessRating: String? = ""
    public static var strengthsComment: String? = ""
    public static var specialCircumstancesComment: String? = ""
    public static var additionalComments: String? = ""
    
    
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
        
        if let inputSwitches = endgameSwitches {
            for inputSwitch in inputSwitches {
                if inputSwitch != nil {
                    inputSwitch.setOn(false, animated: false)
                }
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
        FormController.hasPreloadedCargo = sender.isOn
    }
    
    @IBAction func visitedChargingStationSwitchChanged(_ sender: UISwitch) {
        FormController.visitedChargingStation = sender.isOn
    }
    
    @IBAction func exitedCommunitySwitchChanged(_ sender: UISwitch) {
        FormController.exitedCommunity = sender.isOn
    }
    
    
    @IBAction func coopGridUpdated(_ sender: UIButton) {
        let id = sender.accessibilityIdentifier!
        
        let row = Int(String(id.first!))
        let col = Int(String(id.last!))
        
        //toggle the sender text
        if (sender.titleLabel!.text == " ") {
            sender.setTitle("O", for: .normal)
            FormController.autonomousCoopGrid[row!][col!] = "O"
        } else if (sender.titleLabel!.text == "O"){
            sender.setTitle(" ", for: .normal)
            FormController.autonomousCoopGrid[row!][col!] = " "
        }
        
        //print("Row\(row!) Col\(col!)")
        //print(FormController.autonomousCoopGrid.debugDescription)
    }
    
    
    @IBAction func coopGridUpdatedTeleop(_ sender: UIButton) {
        let id = sender.accessibilityIdentifier!
        
        let row = Int(String(id.first!))
        let col = Int(String(id.last!))
        
        let a = "Hello"
        print(a == "Hello")
        
        //toggle the sender text
        if (sender.titleLabel!.text == " ") {
            sender.setTitle("O", for: .normal)
            FormController.teleOpCoopGrid[row!][col!] = "O"
        } else if (sender.titleLabel!.text == "O"){
            sender.setTitle(" ", for: .normal)
            FormController.teleOpCoopGrid[row!][col!] = " "
        }
        
    }
    
    @IBAction func pickupFromGroundSwitchChanged(_ sender: UISwitch) {
        FormController.pickedUpFromGround = sender.isOn
    }
    
    
    @IBAction func pickupFromDoubleSubstationChanged(_ sender: UISwitch) {
        FormController.pickedUpFromDoubleSubstation = sender.isOn
    }
    
    
    @IBAction func pickupFromSingleSubstationSwitchChanged(_ sender: UISwitch) {
        FormController.pickedUpFromSingleSubstation = sender.isOn
    }
    
    
    @IBAction func noPickupSwitchChanged(_ sender: UISwitch) {
        FormController.noPickup = sender.isOn
    }
    
    
    @IBAction func isShuttleRobotSwitchChanged(_ sender: UISwitch) {
        FormController.isShuttleRobot = sender.isOn
    }
    
    
    @IBAction func pickupTippedConesSwitchChanged(_ sender: UISwitch) {
        FormController.pickupTippedCones = sender.isOn
    }
    
    
    @IBAction func numRobotsIsZero(_ sender: UIButton) {
        FormController.numRobotsOnChargingStation = 0
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsOne(_ sender: UIButton) {
        FormController.numRobotsOnChargingStation = 1
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsTwo(_ sender: UIButton) {
        FormController.numRobotsOnChargingStation = 2
        for option in numRobotOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func numRobotsIsThree(_ sender: UIButton) {
        FormController.numRobotsOnChargingStation = 3
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
            FormController.chargingStationStatus = (sender.titleLabel?.text)!
            chargingStationSelectBtn.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    
    
    @IBAction func matchOutcomeIsWin(_ sender: UIButton) {
        FormController.matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func matchOutcomeIsLoss(_ sender: UIButton) {
        FormController.matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func matchOutcomeIsTie(_ sender: UIButton) {
        FormController.matchOutcomeStatus = sender.titleLabel?.text
        for option in matchOutcomeOptions {
            option.backgroundColor = UIColor.clear
        }
        sender.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func allianceScoreEntered(_ sender: UITextField) {
        FormController.allianceScore = sender.text!
    }
    
    
    @IBAction func numLinksEntered(_ sender: UITextField) {
        FormController.numLinks = sender.text!
    }
    
    @IBAction func oppositionScoreEntered(_ sender: UITextField) {
        FormController.oppositionScore = sender.text!
    }
    
    @IBAction func avgCycleTimeEntered(_ sender: UITextField) {
        FormController.avgCycleTime = sender.text!
    }
    
    
    @IBAction func coopGridRankEntered(_ sender: UISwitch) {
        FormController.atLeastThreeInCoopertitionGrid = sender.isOn
    }
    
    
    @IBAction func activationBonusEntered(_ sender: UISwitch) {
        FormController.activationBonus = sender.isOn
    }
    
    
    @IBAction func speedRatingEntered(_ sender: UITextField) {
        FormController.speedRating = sender.text!
    }
    
    
    @IBAction func awarenessRatingEntered(_ sender: UITextField) {
        FormController.awarenessRating = sender.text!
    }
    
    
    @IBAction func strengthsEntered(_ sender: UITextField) {
        FormController.strengthsComment = sender.text!
    }
    
    @IBAction func specialCircumstancesUpdated(_ sender: UITextField) {
        FormController.specialCircumstancesComment = sender.text!
    }
    
    
    @IBAction func additionalCommentsEntered(_ sender: UITextField) {
        FormController.additionalComments = sender.text!
    }
    
    
    @IBAction func submitReportBtnPressed(_ sender: UIButton) {
        print("Submitted!")
        let name = "\(LoginController.scoutName!) "
        
        let object: [String] = [
            "Scout Name: \(LoginController.scoutName!)",
            "Team Number: \(LoginController.teamNum!)",
            "Match Number: \(LoginController.matchNum!)",
            "Alliance: \(LoginController.alliance!)",
            "Station: \(LoginController.station!)",
            "AUTONOMOUS",
            "Has preloaded cargo? \(FormController.hasPreloadedCargo!)",
            "Visited charging station? \(FormController.visitedChargingStation!)",
            "Exited community? \(FormController.exitedCommunity!)",
            "Autonomous Co-Op Grid: \(FormController.autonomousCoopGrid.description)",
            "TELEOPERATED",
            "Picked up from ground? \(FormController.pickedUpFromGround!)",
            "Picked up from double substation? \(FormController.pickedUpFromDoubleSubstation!)",
            "Picked up from single substation? \(FormController.pickedUpFromSingleSubstation!)",
            "No pickup? \(FormController.noPickup!)",
            "Is shuttle robot? \(FormController.isShuttleRobot!)",
            "Picked up tipped cones? \(FormController.pickupTippedCones!)",
            "Teleoperated Co-Op Grid: \(FormController.teleOpCoopGrid.description)",
            "ENDGAME",
            "Number of robots on charging station \(FormController.numRobotsOnChargingStation!)",
            "Charging station status \(FormController.chargingStationStatus!)",
            "Match outcome \(FormController.matchOutcome!)",
            "Alliance score \(FormController.allianceScore!)",
            "Opposition score \(FormController.oppositionScore!)",
            "Number of links \(FormController.numLinks!)",
            "Average cycle time \(FormController.avgCycleTime!)",
            "At least third in coopertition grid? \(FormController.atLeastThreeInCoopertitionGrid!)",
            "Activation Bonus? \(FormController.activationBonus!)",
            "POSTGAME",
            "Speed rating (1-10) \(FormController.speedRating!)",
            "Awareness rating (1-10) \(FormController.awarenessRating!)",
            "Strengths/weaknesses \(FormController.strengthsComment!)",
            "Special Circumstances \(FormController.specialCircumstancesComment)",
            "Additional comments \(FormController.additionalComments!)"
        ]

        database.child(name).setValue(object)
        sender.setTitle("Submitted!", for: .normal)
       
    }
}

//
//  LoginController.swift
//  ScoutingApp
//
//  Created by Araav Nayak on 8/30/23.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseDatabase

class LoginController: UIViewController {
    
    
    
    public static var scoutName: String? = ""
    public static var teamNum: String? = ""
    public static var matchNum: String? = ""
    public static var alliance: String? = ""
    public static var station: String? = ""
    
    @IBOutlet weak var ScoutNameTextField: UITextField!
    @IBOutlet weak var TeamNumTextField: UITextField!
    @IBOutlet weak var MatchNumTextField: UITextField!
    
    @IBOutlet weak var allianceSelectBtn: UIButton!
    @IBOutlet var allianceOptions: [UIButton]!
    
    @IBOutlet weak var stationSelectBtn: UIButton!
    @IBOutlet var stationOptions: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aOptions = allianceOptions {
            aOptions.forEach { (btn) in
                btn.isHidden = true
                btn.alpha = 0
            }
        }
        
        if let stationOptions2 = stationOptions {
            stationOptions2.forEach { (btn) in
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
    
    
    @IBAction func ScoutNameEntered(_ sender: UITextField) {
        LoginController.scoutName = sender.text!
    }
    
    @IBAction func TeamNumEntered(_ sender: UITextField) {
        LoginController.teamNum = sender.text!
    }
    
    @IBAction func MatchNumEntered(_ sender: UITextField) {
        LoginController.matchNum = sender.text!
    }
    
    @IBAction func allianceSelectBtnPressed(_ sender: UIButton) {
        view.endEditing(true)
        
        allianceOptions.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                //btn.layoutIfNeeded()
            }
        }
    }
    

    @IBAction func allianceOptionSelected(_ sender: UIButton) {
        if let btnLabel = sender.titleLabel?.text {
            print(btnLabel)
            allianceOptions.forEach { (btn) in
                UIView.animate(withDuration: 0.7) {
                    btn.isHidden = !btn.isHidden
                    btn.alpha = btn.alpha == 0 ? 1 : 0
                    //btn.layoutIfNeeded()
                }
            }
            LoginController.alliance = (sender.titleLabel?.text)!
            allianceSelectBtn.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    
    

    @IBAction func stationSelectBtnPressed(_ sender: UIButton) {
        view.endEditing(true)
        
        stationOptions.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                //btn.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func stationOptionSelected(_ sender: UIButton) {
        if let btnLabel = sender.titleLabel?.text {
            print(btnLabel)
            stationOptions.forEach { (btn) in
                UIView.animate(withDuration: 0.7) {
                    btn.isHidden = !btn.isHidden
                    btn.alpha = btn.alpha == 0 ? 1 : 0
                    //btn.layoutIfNeeded()
                }
            }
            LoginController.station = (sender.titleLabel?.text)!
            stationSelectBtn.setTitle(sender.titleLabel?.text, for: .normal)
        }
    }
    
    
    
    
    
}



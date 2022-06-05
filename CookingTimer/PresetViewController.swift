//
//  PresetViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit

class PresetViewController: UIViewController {

    @IBOutlet var MinutesTextField: UITextField!
    @IBOutlet var SecondsTextField: UITextField!
    @IBOutlet var TimernameTextField: UITextField!
    @IBOutlet var TimerLabelMinutes: UILabel!
    @IBOutlet var TimerLabelSeconds: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MinutesTextField.placeholder = "分"
        SecondsTextField.placeholder = "秒"
        TimernameTextField.placeholder = "タイマー名"
        
    }

    @IBAction func OKbotton(){
        
        let MinutesData = MinutesTextField.text!
        let SecondsData = SecondsTextField.text!
        let nameDate = TimernameTextField.text!
        
        TimerLabelMinutes.text = "\(MinutesData)"
        TimerLabelSeconds.text = "\(SecondsData)"
        nameLabel.text = "\(nameDate)"
        
        UserDefaults.standard.set(MinutesData, forKey: "minutes")
        UserDefaults.standard.set(SecondsData, forKey: "seconds")
        UserDefaults.standard.set(nameDate, forKey: "name")
        //これだとでもテキストを表示した時点で保存されてるよね〜//
    }
    
    @IBAction func Savebotton(){
        
    
        
        func alert(title:String, message:String) {
                alertController = UIAlertController(title: title,
                                           message: message,
                                           preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK",
                                               style: .default,
                                               handler: nil))
                present(alertController, animated: true)
            }
        
        alert(title: "保存されました。",
                      message: "タイマーの情報が保存されました。")
        
    }
}

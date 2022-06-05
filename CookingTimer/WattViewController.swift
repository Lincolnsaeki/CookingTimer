//
//  WattViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit

class WattViewController: UIViewController {
    
    @IBOutlet var MinutesTextField: UITextField!
    @IBOutlet var SecondsTextField: UITextField!
    @IBOutlet var WattTextField: UITextField!
    @IBOutlet var ChangeWattTextField: UITextField!
    @IBOutlet var TimerLabelMinutes: UILabel!
    @IBOutlet var TimerLabelSeconds: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WattTextField.placeholder = "基準のW"
        MinutesTextField.placeholder = "分"
        SecondsTextField.placeholder = "秒"
        ChangeWattTextField.placeholder = "変更したいW"
    }
    
    @IBAction func OKbotton(){
        
        let MinutesData = MinutesTextField.text!
        let SecondsData = SecondsTextField.text!
        //let beforeDate = WattTextField.text!//
        
        TimerLabelMinutes.text = "\(MinutesData)"
        TimerLabelSeconds.text = "\(SecondsData)"
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

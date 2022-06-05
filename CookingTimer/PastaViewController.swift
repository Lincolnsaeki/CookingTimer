//
//  PastaViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit

class PastaViewController: UIViewController {
    @IBOutlet var TimerLabelMinutes: UILabel!
    @IBOutlet var TimerLabelSeconds: UILabel!
    @IBOutlet var twoBotton: UIButton!
    @IBOutlet var threeBotton: UIButton!
    @IBOutlet var fiveBotton: UIButton!
    @IBOutlet var sevenBotton: UIButton!
    @IBOutlet var elevenBotton: UIButton!
    
    var MinutesCount = 0
    var SecondsCount = "00"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func twoTimer(){
        MinutesCount =  2
        
        TimerLabelMinutes.text = String(MinutesCount)
        TimerLabelSeconds.text = String(SecondsCount)
    }
    @IBAction func threeTimer(){
        MinutesCount =  3
        
        TimerLabelMinutes.text = String(MinutesCount)
        TimerLabelSeconds.text = String(SecondsCount)
    }
    @IBAction func fiveTimer(){
        MinutesCount =  5
        
        TimerLabelMinutes.text = String(MinutesCount)
        TimerLabelSeconds.text = String(SecondsCount)
    }
    @IBAction func sevenTimer(){
        MinutesCount =  7
        
        TimerLabelMinutes.text = String(MinutesCount)
        TimerLabelSeconds.text = String(SecondsCount)
    }
    @IBAction func elevenTimer(){
        MinutesCount =  11
        
        TimerLabelMinutes.text = String(MinutesCount)
        TimerLabelSeconds.text = String(SecondsCount)
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

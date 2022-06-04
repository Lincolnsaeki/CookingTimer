//
//  BoiledEggViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/24.
//

import UIKit

class BoiledEggViewController: UIViewController {
    @IBOutlet var TimerLabelMinutes: UILabel!
    @IBOutlet var TimerLabelSeconds: UILabel!
    @IBOutlet var threeBotton: UIButton!
    @IBOutlet var fiveBotton: UIButton!
    @IBOutlet var sevenBotton: UIButton!
    
    var MinutesCount = 0
    var SecondsCount = "00"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}

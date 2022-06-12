//
//  MainTableViewCell.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/06/05.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var time = 5
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var TimerNameLabel: UILabel!
    @IBOutlet weak var Starttimer: UIButton!
    @IBOutlet weak var Stoptimer: UIButton!
    var alertController: UIAlertController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timerLabel.text = String(time)
        Starttimer.layer.cornerRadius = 10
    }
    
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
    }
    // ボタンが押された時の処理
    @IBAction func buttonAction(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.time -= 1
            self.timerLabel.text = String(self.time)
            
            if self.time == 0 {
                self.alert(title: "タイマーストップ",
                           message: "時間です")
            }
        })
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
    }
    
}





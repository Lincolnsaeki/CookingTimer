//
//  MainTableViewCell.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/06/05.
//

import UIKit
import RealmSwift

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerNameLabel: UILabel!
    @IBOutlet weak var Starttimer: UIButton!
    @IBOutlet weak var Stoptimer: UIButton!

    
    var time = 0
    var timer = Timer()
    var delegate: UIViewController? //必要
    var alert:UIAlertController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let realm = try! Realm()
               let timer = realm.objects(TimerModel.self)
               
               for objData in timer{
                   timerLabel.text = String(time)
                   Starttimer.layer.cornerRadius = 10
               }
        
        
        
    }
    
    // ボタンが押された時の処理
    @IBAction func startButton(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] (timer) in
            self.time -= 1
            self.timerLabel.text = String(self.time)
            
            if self.time == 0 {
                timer.invalidate()
                self.showAlert()
            }
        })
    }
    @IBAction func stopButton(){
        timer.invalidate()
        
    }
    
    func showAlert(){
        alert = UIAlertController(title:timerNameLabel.text , message: "タイマーが終了しました", preferredStyle: UIAlertController.Style.alert)
        
        let OKAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action:UIAlertAction!) -> Void in
        })
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{
            action in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(OKAction)
        delegate!.present(alert, animated: true, completion: nil) //必要
    }
}

//
//  TableViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/06/01.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    let realm = try! Realm()
    var timer = [TimerModel]()
    var time = [String]()
    var time:[String] = [timer[indexPath.row].seconds]
    var delegate: UIViewController?
    var alert:UIAlertController!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
    
    // MARK: - Table view data source
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Array(realm.objects(TimerModel.self)).reversed()
    // Realm DBから保存されてるツイートを全取得
        tableView.reloadData() // テーブルビューをリロード
    }

    //初期のcellの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timer.count
    }
    //cellのサイズ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.timerLabel.text = String(timer[indexPath.row].seconds)
        cell.timerNameLabel.text = timer[indexPath.row].timerName
        cell.Starttimer.addTarget(self, action: #selector(self.startButton(_:)), for: UIControl.Event.touchUpInside)
        cell.Starttimer.tag = indexPath.row
        cell.Starttimer.layer.cornerRadius = 10
        cell.Stoptimer.addTarget(self, action: #selector(self.stopButton(_:)), for: UIControl.Event.touchUpInside)

        return cell
    }
    //startボタンが押されたら
    @objc func startButton(_ sender: UIButton) {
        let serected = timer[sender.tag]
           print(serected)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] (timer) in
            self.time -= 1
            self.timerLabel.text = String(self.time)
            
            if self.time == 0 {
                timer.invalidate()
                self.showAlert()
            }
        })
        
        }
    //stopボタンが押されたら
    @objc func stopButton(_ sender: UIButton){
        timer.invalidate()
    }
    //アラートの設定
    func showAlert(){
        alert = UIAlertController(title: timerNameLabel.text, message: "タイマーが終了しました", preferredStyle: UIAlertController.Style.alert)
        
        let OKAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action:UIAlertAction!) -> Void in
            
        })
                
        alert.addAction(OKAction)
        delegate!.present(alert, animated: true, completion: nil) //必要
    }
    
    
}

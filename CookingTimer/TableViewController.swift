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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    // MARK: - Table view data source
    
    func getTimerData() {
            timer = Array(realm.objects(TimerModel.self)).reversed()
        // Realm DBから保存されてるツイートを全取得
            tableView.reloadData() // テーブルビューをリロード
        }

    //初期のcellの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timer.count
    }
    //cellのサイズ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        cell.delegate = self
        return cell
    }
    
}

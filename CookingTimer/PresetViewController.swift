//
//  PresetViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit

class PresetViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var TimerPicker: UIPickerView!
    @IBOutlet var TimernameTextField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    

    var alertController: UIAlertController!
    var timer:Timer = Timer()
    var count:Int = 0
    let dataList = [[Int](0...24), [Int](0...60), [Int](0...60)]
    
    override func viewDidLoad() {
            super.viewDidLoad()
        TimernameTextField.placeholder = "タイマー名"
            //「時間」のラベルを追加
            let hStr = UILabel()
            hStr.text = "時間"
            hStr.sizeToFit()
            hStr.frame = CGRect(x: TimerPicker.bounds.width/4 - hStr.bounds.width/2, y: TimerPicker.bounds.height/2 - (hStr.bounds.height/2), width: hStr.bounds.width, height:hStr.bounds.height)
        TimerPicker.addSubview(hStr)
            //「分」のラベルを追加
            let mStr = UILabel()
            mStr.text = "分"
            mStr.sizeToFit()
            mStr.frame = CGRect(x: TimerPicker.bounds.width/2 - mStr.bounds.width/2, y: TimerPicker.bounds.height/2 - (mStr.bounds.height/2), width: mStr.bounds.width, height: mStr.bounds.height)
        TimerPicker.addSubview(mStr)
            //「秒」のラベルを追加
            let sStr = UILabel()
            sStr.text = "秒"
            sStr.sizeToFit()
            sStr.frame = CGRect(x: TimerPicker.bounds.width*3/4 - sStr.bounds.width/2, y: TimerPicker.bounds.height/2 - (sStr.bounds.height/2), width: sStr.bounds.width, height: sStr.bounds.height)
        TimerPicker.addSubview(sStr)
        }
        //コンポーネントの個数を返すメソッド
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return dataList.count
        }
        //コンポーネントに含まれるデータの個数を返すメソッド
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dataList[component].count
        }
        //サイズを返すメソッド
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return pickerView.bounds.width * 1/4
        }
        //データを返すメソッド
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let pickerLabel = UILabel()
            pickerLabel.textAlignment = NSTextAlignment.left
            pickerLabel.text = String(dataList[component][row])
            return pickerLabel
        }

    @IBAction func OKbotton(){
        
        let nameDate = TimernameTextField.text!
        
        nameLabel.text = "\(nameDate)"
        UserDefaults.standard.set(nameDate, forKey: "name")
        //これだとでもテキストを表示した時点で保存されてるよね〜//
    }
    
    @IBAction func Savebotton(){
        
    
        
        func alert(title:String, message:String) {
            alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
            present(alertController, animated: true)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
        alert(title: "保存されました。",
                      message: "タイマーの情報が保存されました。")
        
        
    }
    
}



//
//  PresetViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit
import RealmSwift

class PresetViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var timerPicker: UIPickerView!
    @IBOutlet var timerNameTextField: UITextField!
    
    let dataList = [[Int](0...6), [Int](0...60), [Int](0...60)]
    let realm = try! Realm()
    var timerNameTextFieldString = ""
    var hour: Int!
    var minute: Int!
    var second: Int!
    var count: Int!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        timerPicker.dataSource = self
        timerPicker.delegate = self
        timerPickerSetup()
    }
    
    @IBAction func saveButton(){
        //PickerViewの値取り出し
        
        hour = dataList[0][timerPicker.selectedRow(inComponent: 0)] * 60 * 60
        minute = dataList[0][timerPicker.selectedRow(inComponent: 1)] * 60
        second = dataList[0][timerPicker.selectedRow(inComponent: 2)]
        count = hour + minute + second
        
        print(count)
        

        //TextFieldの値を取り出す
        timerNameTextFieldString = timerNameTextField.text!
        print(timerNameTextFieldString)

        //値をrealmに保存するコードを書く
        let timer = TimerModel()
        timer.timerName = timerNameTextFieldString
        timer.seconds = count
        
        try! realm.write({
            realm.add(timer) // レコードを追加
        })

        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func timerPickerSetup(){
        //「時間」のラベルを追加
        let hStr = UILabel()
        hStr.text = "時間"
        hStr.sizeToFit()
        hStr.frame = CGRect(x: timerPicker.bounds.width/4 - hStr.bounds.width/2, y: timerPicker.bounds.height/2 - (hStr.bounds.height/2), width: hStr.bounds.width, height:hStr.bounds.height)
        timerPicker.addSubview(hStr)
        //「分」のラベルを追加
        let mStr = UILabel()
        mStr.text = "分"
        mStr.sizeToFit()
        mStr.frame = CGRect(x: timerPicker.bounds.width/2 - mStr.bounds.width/2, y: timerPicker.bounds.height/2 - (mStr.bounds.height/2), width: mStr.bounds.width, height: mStr.bounds.height)
        timerPicker.addSubview(mStr)
        //「秒」のラベルを追加
        let sStr = UILabel()
        sStr.text = "秒"
        sStr.sizeToFit()
        sStr.frame = CGRect(x: timerPicker.bounds.width*3/4 - sStr.bounds.width/2, y: timerPicker.bounds.height/2 - (sStr.bounds.height/2), width: sStr.bounds.width, height: sStr.bounds.height)
        timerPicker.addSubview(sStr)
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
}



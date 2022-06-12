//
//  PresetViewController.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/05/29.
//

import UIKit

class PresetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var start: UIButton!

    var timer:Timer = Timer()
    var count:Int = 0

    let dataList = [[Int](0...24), [Int](0...60), [Int](0...60)]

    override func viewDidLoad() {
        super.viewDidLoad()
        //「時間」のラベルを追加
        let hStr = UILabel()
        hStr.text = "時間"
        hStr.sizeToFit()
        hStr.frame = CGRect(x: pickerView.bounds.width/4 - hStr.bounds.width/2, y: pickerView.bounds.height/2 - (hStr.bounds.height/2), width: hStr.bounds.width, height:hStr.bounds.height)
        pickerView.addSubview(hStr)
        //「分」のラベルを追加
        let mStr = UILabel()
        mStr.text = "分"
        mStr.sizeToFit()
        mStr.frame = CGRect(x: pickerView.bounds.width/2 - mStr.bounds.width/2, y: pickerView.bounds.height/2 - (mStr.bounds.height/2), width: mStr.bounds.width, height: mStr.bounds.height)
        pickerView.addSubview(mStr)
        //「秒」のラベルを追加
        let sStr = UILabel()
        sStr.text = "秒"
        sStr.sizeToFit()
        sStr.frame = CGRect(x: pickerView.bounds.width*3/4 - sStr.bounds.width/2, y: pickerView.bounds.height/2 - (sStr.bounds.height/2), width: sStr.bounds.width, height: sStr.bounds.height)
        pickerView.addSubview(sStr)
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

    @IBAction func startCountButton(_ sender: Any) {
        timer.invalidate()
        count = dataList[0][pickerView.selectedRow(inComponent: 0)] * 60 * 60
            +  dataList[0][pickerView.selectedRow(inComponent: 1)] * 60
            +  dataList[0][pickerView.selectedRow(inComponent: 2)]
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector:#selector(countDown), userInfo:nil, repeats:true)
    }

    @IBAction func reset(_ sender: Any) {
        count = 0
        pickerLabel.text = "カウントダウン終了"
    }

    //タイマーから呼び出されるメソッド
    @objc func countDown(){
        count -= 1
        if(count > 0) {
            pickerLabel.text = "残り\(count)秒です。"
        } else {
            pickerLabel.text = "カウントダウン終了"
            timer.invalidate()
        }
    }
}

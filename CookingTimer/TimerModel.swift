//
//  Timer.swift
//  CookingTimer
//
//  Created by Kento Katsumata on 2022/06/13.
//

import Foundation
import RealmSwift


class TimerModel: Object {
    @objc dynamic var timerName: String = ""
    @objc dynamic var seconds: Int = 0
}

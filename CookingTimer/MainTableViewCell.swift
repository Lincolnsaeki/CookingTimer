//
//  MainTableViewCell.swift
//  CookingTimer
//
//  Created by 佐伯凜乃介 on 2022/06/05.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var Mtimer: UILabel!
    @IBOutlet weak var Stimer: UILabel!
    @IBOutlet weak var TimerNameLabel: UILabel!
    @IBOutlet weak var Stoptimer: UIButton!
    @IBOutlet weak var StartTimer: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
}

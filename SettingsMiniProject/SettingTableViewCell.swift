//
//  SettingTableViewCell.swift
//  SettingsMiniProject
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    var setting: Setting?
    
    weak var delegate: SettingTableViewCellDelegate?
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithSetting(setting: Setting) {
        self.setting = setting
        iconImageView.image = setting.image
        settingLabel.text = setting.name
        settingsSwitch.on = setting.isSet
        if setting.isSet {
            self.backgroundColor = .purpleColor()
        } else {
            self.backgroundColor = .whiteColor()
        }
    }

    @IBAction func switchButtonTapped(sender: AnyObject) {
        // let model know that it has changed, but let view know
        delegate?.settingSwitchValueChanged(self, selected: settingsSwitch.on)
        
    }
}

protocol SettingTableViewCellDelegate: class {
    func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool)
}

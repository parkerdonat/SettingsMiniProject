//
//  SettingsViewController.swift
//  SettingsMiniProject
//
//  Created by Parker Donat on 4/13/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.sharedInstance.mySettings.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell") as? SettingTableViewCell
        
        let setting = SettingsController.sharedInstance.mySettings[indexPath.row]
        cell?.updateWithSetting(setting)
        
        cell?.delegate = self
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell ?? UITableViewCell()
    }
    
    // Reload just the cell your tapped is much better.
    func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting,
            cellIndexPath = tableView.indexPathForCell(cell) else {return}
        tableView.beginUpdates()
        SettingsController.sharedInstance.updateSettingSelection(setting, selected: selected)
        tableView.reloadRowsAtIndexPaths([cellIndexPath], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
    // RELOADING THE WHOLE TABLEVIEW LOOSES ANIMATION ON SWITCH
//    func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool) {
//        guard let setting = cell.setting else { return }
//        
//        SettingsController.sharedInstance.updateSettingSelection(setting, selected: selected)
//        tableView.reloadData()
//    }
    
}

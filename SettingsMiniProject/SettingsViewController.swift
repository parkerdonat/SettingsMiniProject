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
    
    func settingSwitchValueChanged(cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting else { return }
        
        SettingsController.sharedInstance.updateSettingSelection(setting, selected: selected)
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

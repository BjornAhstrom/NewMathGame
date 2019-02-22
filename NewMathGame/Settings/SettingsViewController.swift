//
//  SideMenuViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-11.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SettingsViewController: ColorViewController {
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var changeThemeSwitchButton: UISwitch!
    @IBOutlet weak var textThemeLabel: UILabel!
    @IBOutlet var themeLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        applayTheme()
        changeThemeSwitchButton.isOn = UserDefaults.standard.bool(forKey: "Switch_Button")
    }
    
    func setFontAndColorOnLabels() {
        settingsLabel.textColor = Theme.current.textColor
        settingsLabel.font = UIFont(name: Theme.current.fontForLabels, size: 30)
        textThemeLabel.textColor = Theme.current.textColor
        textThemeLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        
        for themeLabel in themeLabels {
            themeLabel.font = UIFont(name: Theme.current.fontForLabels, size: 20)
            themeLabel.textColor = Theme.current.textColor
        }
    }
    
    @IBAction func themeChangeSwitchButton(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "Switch_Button")
        
        Theme.current = sender.isOn ? ColorTheme() : DarkTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "Theme")
        UserDefaults.standard.synchronize()
        applayTheme()
    }
    
    fileprivate func applayTheme() {
        setFontAndColorOnLabels()
        setGradientBackground()
    }
}

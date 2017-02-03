//
//  SettingsViewController.swift
//  amfocused
//
//  Created by Denis Nascimento on 30/01/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        setupView()
    }
    
    
    func setupView() -> Void {
       
        let setting = Setting.row(rowNumber: 1) as! Setting
        
        let url = setting.url_jira
        print("jira:\(url)")
    }
    
}

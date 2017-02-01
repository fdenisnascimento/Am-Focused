//
//  MainViewController.swift
//  amfocused
//
//  Created by Denis Nascimento on 25/01/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    let appDelegate:AppDelegate = (NSApplication.shared().delegate as? AppDelegate)!
    var timer = Timer()
    let popover = NSPopover()
    
    @IBOutlet weak var btnStart: NSButton!
    @IBOutlet weak var btnStop: NSButton!
    @IBOutlet weak var labelTime: NSTextField!
    
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        timer  = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func setupView() -> Void {
        
        if appDelegate.timer.isValid {
            btnStart.title = "Pause"
        }else {
            btnStart.title = "Start"
        }

    }
    
    @IBAction func close(_ sender: NSButton) {
        appDelegate.togglePopover(sender: sender)
    }
    
    @IBAction func quit(_ sender: Any) {
        NSApp.terminate(self)
    }
    
    @IBAction func btnStart(_ sender: Any) {
        
        appDelegate.startClock()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        appDelegate.stopTime()
    }
    
    
    
    func updateCounter() -> Void {
        labelTime.stringValue = appDelegate.stringTime
    }
    
    @IBAction func goToSettings(_ sender: AnyObject) {
        
        appDelegate.closePopover(sender: sender)
        if let vc:SettingsViewController = SettingsViewController(nibName: "SettingsViewController", bundle:nil) {
            self.presentViewControllerAsModalWindow(vc)
        }
        
    }
    
    
}



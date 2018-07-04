//
//  MainViewController.swift
//  amfocused
//
//  Created by Denis Nascimento on 25/01/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    let appDelegate:AppDelegate = (NSApplication.shared.delegate as? AppDelegate)!
    var timer = Timer()
    let popover = NSPopover()
    
    
    @IBOutlet weak var textTimeInterval: NSTextField!
    @IBOutlet weak var btnStart: NSButton!
    @IBOutlet weak var btnStop: NSButton!
    @IBOutlet weak var labelTime: NSTextField!
    
    @IBOutlet weak var btnSound: NSButton!
    
    
    
    @IBAction func setSoundEnable(_ sender: NSButton) {
        appDelegate.enabledSound = btnSound.isEnabled
        appDelegate.playSound()
    }
    
    func getTimeInterval() -> Int {
        return Int(self.textTimeInterval.stringValue)!
    }
    
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
        appDelegate.counterDefault = getTimeInterval()*60
        appDelegate.startPomodore()
    }
    
    @IBAction func btnStartInterval(_ sender: Any) {
        appDelegate.counterDefault = 5*60
        appDelegate.startInterval()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        appDelegate.stopTime()
    }
    
    
    
    @objc func updateCounter() -> Void {
        labelTime.stringValue = appDelegate.stringTime
    }
    
    @IBAction func goToSettings(_ sender: AnyObject) {
        appDelegate.closePopover(sender: sender)
            self.presentViewControllerAsModalWindow(SettingsViewController())
    }
    
    
}



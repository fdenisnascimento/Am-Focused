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
    
    @IBOutlet weak var btnStart: NSButton!
    @IBOutlet weak var btnStop: NSButton!
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}

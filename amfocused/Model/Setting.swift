//
//  Settings.swift
//  amfocused
//
//  Created by Denis Nascimento on 03/02/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


class Setting {
    
    var id = -1
    var work_interval = -1
    var short_break = -1
    var long_break = -1
    var long_break_after = -1
    var target = -1
    var work_completed_sound = false
    var end_break_sound = false
    var launch_at_startup =  true
    var chronometer_sound = false
    var completion_notifications = false
    var show_time_in_menu_bar = false
    var url_jira = ""

}


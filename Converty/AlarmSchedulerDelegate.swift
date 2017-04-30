//
//  AlarmSchedulerDelegate.swift
//  Converty
//
//  Created by Missy Allan on 4/30/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation

protocol AlarmSchedulerDelegate {
    
    func setNotificationWithDate(_ date:Date, onWeekdaysForNotify: [Int], snoozeEnabled: Bool, onSnooze:Bool, soundName: String, index: Int)
    
    //helpers 
    func setNotificationForSnooze(snoozeMinute: Int, soundName: String, index: Int)
    func setupNotificationSettings()
    func reschedule()
    func checkNotification()
}


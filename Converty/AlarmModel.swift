//
//  AlarmModel.swift
//  Converty
//
//  Created by Missy Allan on 4/30/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation
import MediaPlayer

struct Alarm: PropertyReflectable {
    var date: Date = Date()
    var enabled: Bool = false
    var snoozeEnabled: Bool = false
    var repeatWeekdays: [Int] = []
    var uuid: String = ""
    var mediaID: String = ""
    var mediaLabel: String = "bell"
    var label: String = "Alarm"
    var onSnooze: Bool = false
    
    init() {}

   
    init(date: Date, enabled: Bool, snoozeEnabled: Bool, repeatWeekdays: [Int], uuid: String, mediaID: String, mediaLabel: String, label: String, onSnooze:Bool) {
        
        self.date = date
        self.enabled = enabled
        self.snoozeEnabled = snoozeEnabled
        self.repeatWeekdays = repeatWeekdays
        self.uuid = uuid
        self.mediaID = mediaID
        self.mediaLabel = mediaLabel
        self.label = label
        self.onSnooze = onSnooze
    }
    
    init(_ dict: PropertyReflectable.RepresentationType) {
        
        date = dict["date"] as! Date
        enabled = dict["enabled"] as! Bool
        snoozeEnabled = dict["snoozeEnabled"] as! Bool
        repeatWeekdays = dict["repeatWeekdays"] as! [Int]
        uuid = dict["uuid"] as! String
        mediaID = dict["mediaID"] as! String
        mediaLabel = dict["mediaLabel"] as! String
        label = dict["label"] as! String
        onSnooze = dict["onSnooze"] as! Bool
    }
    
    static var propertyCount: Int = 9
    
}

extension Alarm {
        var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self.date)
    }
}
    
// TODO: Implement viewModel Alarms 
    
    class Alarms: Persistable {
        
        let userDefaults: UserDefaults =  UserDefaults.standard
        let persistKey: String = "myAlarmKey"
        var alarms: [Alarm] = [] {
            //observer sync with user defaults
            didSet{
                persist()
            }
        }
        
        private func getAlarmsDictRepresentation() -> [PropertyReflectable.RepresentationType] {
            return alarms.map{$0.propertyDictRepresentation}
        }
       
        init() {
            alarms = getAlarms()
        }
        
        func persist() {
            userDefaults.set(getAlarmsDictRepresentation(), forKey: persistKey)
            userDefaults.synchronize()
        }

        func unpersist() {
            for key in userDefaults.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
            }
        }
        
        var count: Int {
            return alarms.count
        }
        
       //get all alarms from UserDefaults
    private func getAlarms() -> [Alarm] {
            let array = UserDefaults.standard.array(forKey: persistKey)
            guard let alarmArray = array else {
                return [Alarm]()
            }
            if let dicts = alarmArray as? [PropertyReflectable.RepresentationType] {
                if dicts.first?.count == Alarm.propertyCount{
                    return dicts.map{Alarm($0)}
                }
            }
            unpersist()
            return [Alarm]()
    }
}


    
    
    

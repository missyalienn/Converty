//
//  Persistable.swift
//  Converty
//
//  Created by Missy Allan on 4/30/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation
protocol Persistable {
    
    var userDefaults: UserDefaults {get}
    var persistKey: String {get}
    func persist()
    func unpersist()
    
}


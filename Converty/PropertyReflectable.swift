//
//  PropertyReflectable.swift
//  Converty
//
//  Created by Missy Allan on 4/30/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation

protocol PropertyReflectable {
    typealias representationType = [String: Any]
    typealias valuesType = [Any]
    typealias namesType = [String]
    
    var propertyDictRepresentation: representationType {get}
    var propertyValues: valuesType {get}
    var propertyNames: namesType {get}
    static var propertyCount: Int {get}
    
    init(_ repType: representationType)

    
}


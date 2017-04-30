//
//  PropertyReflectable.swift
//  Converty
//
//  Created by Missy Allan on 4/30/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation

protocol PropertyReflectable {
    typealias RepresentationType = [String: Any]
    typealias ValuesType = [Any]
    typealias NamesType = [String]
    
    var propertyDictRepresentation: RepresentationType {get}
    var propertyValues: ValuesType {get}
    var propertyNames: NamesType {get}
    static var propertyCount: Int {get}
    //construction from representation type
    init(_ repType: RepresentationType)
    
    
}

//default implementation
extension PropertyReflectable {
    
    var propertyDictRepresentation: RepresentationType {
        var returnDict: [String: Any] = [:]
        for case let (label, value) in Mirror(reflecting: self).children {
            guard let unwrappedLabel = label else {
                continue
            }
            returnDict.updateValue(value, forKey: unwrappedLabel)
        }
        return returnDict
    }
    
    var propertyValues: ValuesType {
        return Array(propertyDictRepresentation.values)
        
    }
    
    var propertyNames: NamesType {
        return Array(propertyDictRepresentation.keys)
    }
    
}







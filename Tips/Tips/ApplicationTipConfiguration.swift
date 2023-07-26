//
//  TipConfiguration.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import TipKit

public struct ApplicationTipConfiguration {
        
    public static var storeLocation: DatastoreLocation {
        var url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        url = url.appending(path: "tipstore")
        return DatastoreLocation(url: url)
    }
    
    public static var displayFrequency: DisplayFrequency {
        .immediate // Show all tips as soon as eligible.
    }
    
}

//
//  TipConfiguration.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import TipKit


/// The `ApplicationTipConfiguration` struct provides values for the `DatastoreLocation` and `DisplayFrequency` Tips configuration options.
public struct ApplicationTipConfiguration {
        
    /// The `DatastoreLocation` that `Tips` will use when configured. In this example, the Tips data store is located in the app's Application Support Directory.
    public static var storeLocation: Tips.ConfigurationOption.DatastoreLocation {
        var url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        url = url.appending(path: "tipstore")
        return .url(url)
    }
    
    /// The `DisplayFrequency` used by `Tips`. In this example, `Tip`s will show immediately.
    public static var displayFrequency: Tips.ConfigurationOption.DisplayFrequency {
        .immediate
    }
    
}

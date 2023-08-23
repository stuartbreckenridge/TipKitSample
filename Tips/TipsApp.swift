//
//  TipsApp.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import SwiftUI
import TipKit

@main
struct TipsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([.datastoreLocation(ApplicationTipConfiguration.storeLocation),
                                               .displayFrequency(ApplicationTipConfiguration.displayFrequency)])
                }
        }
    }
    
}

//
//  GeneratedNumbersTip.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import TipKit

public struct GeneratedNumbersTip: Tip {
    
    @Parameter
    static var hasGeneratedNumbers: Bool = false
    
    static let countOfGeneratedNumbers: Event = Event<Tips.EmptyDonation>(id: "tip.event.user-generated-numbers")
    
    public var id: String {
        return "tip.identifier.generated-numbers"
    }
    
    public var title: Text {
        return Text("tip.title.generated-numbers", comment: "Generated Numbers Tip Title")
    }
    
    public var message: Text? {
        return Text("tip.message.generated-numbers", comment: "Generated Numbers Tip Message")
    }
    
    public var asset: Image? {
        return Image(systemName: "info.circle")
    }
    
    public var actions: [Action] {
        [
            Action(
                id: "action.title.dismiss",
                title: String(localized: "action.title.dismiss", comment: "Dismiss")
            ),
            Action(id: "action.title.find-out-more",
                   title: String(localized: "action.title.find-out-more", comment: "Find Out More")
            )
        ]
    }
    
    public var rules: [Rule] {
        #Rule(Self.$hasGeneratedNumbers) { $0 == true } // User has generated numbers, which makes this tip eligible for display.
        #Rule(Self.countOfGeneratedNumbers) { $0.donations.count == 2 } // This tip displays after the user has generated numbers twice.
    }
    
    public var options: [TipOption] {
        [Tips.MaxDisplayCount(1)]
    }
}







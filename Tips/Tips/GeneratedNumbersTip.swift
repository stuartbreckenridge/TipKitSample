//
//  GeneratedNumbersTip.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import TipKit


/// The `GeneratedNumbersTip` displays a tip which describes how the random numbers
/// were generated.
///
/// ## Rules
/// - This tip is eligible for display when the `PickNumbersTip.hasGeneratedNumbers` `Bool` is `true`, and
/// - The user has generated numbers twice, which is counted via `donate()` calls to
/// `GeneratedNumbersTip.countOfGeneratedNumbers.donate()`
///
/// ## Options
/// - This tip will display a maximum of one time.
public struct GeneratedNumbersTip: Tip {
    
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
        #Rule(PickNumbersTip.$hasGeneratedNumbers) { $0 == true }
        #Rule(Self.countOfGeneratedNumbers) { $0.donations.count == 2 }
    }
    
    public var options: [TipOption] {
        [Tips.MaxDisplayCount(1)]
    }
}







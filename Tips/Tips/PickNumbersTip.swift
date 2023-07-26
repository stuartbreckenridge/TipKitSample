//
//  PickNumbersTip.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import TipKit

public struct PickNumbersTip: Tip {
    
    @Parameter
    static var hasGeneratedNumbers: Bool = false
    
    public var id: String {
        return "tip.identifier.pick-numbers"
    }
    
    public var title: Text {
        return Text("tip.title.pick-numbers", comment: "Pick Numbers Tip Title")
    }
    
    public var message: Text? {
        return Text("tip.message.pick.numbers", comment: "Pick Numbers Tip Message")
    }
    
    public var asset: Image? {
        return Image(systemName: "hand.tap")
    }
    
    public var actions: [Action] {
        [
            Action(
                id: "action.title.dismiss",
                title: String(localized: "action.title.dismiss", comment: "Dismiss")
            ),
            Action(
                id: "action.title.try-now",
                title: String(localized: "action.title.try-now", comment: "Try Now")
            )
        ]
    }
    
    public var rules: [Rule] {
        #Rule(Self.$hasGeneratedNumbers) { $0 == false } // User has never generated numbers, which makes this tip eligible for display.
    }
    
    public var options: [TipOption] {
        [Tips.MaxDisplayCount(1)]
    }
    
}



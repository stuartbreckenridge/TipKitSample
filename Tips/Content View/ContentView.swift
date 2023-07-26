//
//  ContentView.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var viewModel = ContentViewModel()
    
    private var pickNumbersTip = PickNumbersTip()
    private var generatedNumbersTip = GeneratedNumbersTip()
    
    var body: some View {
        VStack {
            
            HStack {
                ForEach(0..<viewModel.latestNumbers.count, id: \.self) { i in
                    BallView(number: viewModel.latestNumbers[i])
                }
            }
            .popoverTip(generatedNumbersTip, arrowEdge: .top) { action in
                if action.id == "action.title.dismiss" {
                    generatedNumbersTip.invalidate(reason: .userClosedTip)
                }
                if action.id == "action.title.find-out-more" {
                    generatedNumbersTip.invalidate(reason: .userPerformedAction)
                    UIApplication.shared.open(URL(string: "https://developer.apple.com/documentation/gameplaykit/gkrandomdistribution")!)
                }
            }
            
            Spacer()
            Button(action: {
                viewModel.latestNumbers = LottoGenerator.new()
                PickNumbersTip.hasGeneratedNumbers = true
                GeneratedNumbersTip.hasGeneratedNumbers = true
                GeneratedNumbersTip.countOfGeneratedNumbers.donate()
            }, label: {
                Text("button.title.pick-numbers", comment: "Pick Numbers")
            })
            .buttonStyle(.borderedProminent)
            .popoverTip(pickNumbersTip, arrowEdge: .bottom) { action in
                if action.id == "action.title.dismiss" {
                    pickNumbersTip.invalidate(reason: .userClosedTip)
                }
                if action.id == "action.title.try-now" {
                    pickNumbersTip.invalidate(reason: .userPerformedAction)
                    PickNumbersTip.hasGeneratedNumbers = true
                    viewModel.latestNumbers = LottoGenerator.new()
                    GeneratedNumbersTip.hasGeneratedNumbers = true
                    GeneratedNumbersTip.countOfGeneratedNumbers.donate()
                }
            }
        }
        .padding()
        .task {
            for await status in pickNumbersTip.shouldDisplayUpdates {
                print("Pick Numbers Tip Display Eligibility: \(status)")
            }
        }
        .task {
            for await status in generatedNumbersTip.shouldDisplayUpdates {
                print("Generated Numbers Tip Display Eligibility: \(status)")
            }
        }
    }
    
    private struct BallView: View {
        
        var number: Int
        
        var body: some View {
            ZStack {
                Circle()
                    .foregroundStyle(.red)
                
                Text(verbatim: "\(number)")
                    .bold()
                    .fontWidth(.condensed)
                    .foregroundStyle(.white)
            }
        }
    }
    
}

#Preview {
    ContentView()
}

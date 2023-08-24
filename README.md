#  Tips

![Screenshot showing TipKit in action.](https://github.com/stuartbreckenridge/TipKitSample/blob/main/TipKit.png?raw=true)

This sample app uses TipKit—as of Xcode 15 beta 7—to show two different tips:

- `PickNumbersTip`: presents a tip explaining what the pick numbers button does. Eligibilty for tip display is via `@Parameter` only.
- `GeneratedNumbersTip`:  presents a tip after the user has generated numbers twice, explains what number generator was used, with the option to find out more. Eligibility for tip display is a combination of `@Parameter` and donated `Event`s.

### Tip Configuration
Tip configuration is handled at launch:

```swift

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        try? Tips.configure([.datastoreLocation(ApplicationTipConfiguration.storeLocation),
                                   .displayFrequency(ApplicationTipConfiguration.displayFrequency)])
    }
```

```swift
public struct ApplicationTipConfiguration {
        
    public static var storeLocation: Tips.ConfigurationOption.DatastoreLocation {
        var url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        url = url.appending(path: "tipstore")
        return .url(url: url)
    }
    
    public static var displayFrequency: Tips.ConfigurationOption.DisplayFrequency {
        .immediate // Show all tips as soon as eligible.
    }
    
}
```

### Tracking Display Eligibility

Two tasks are attached to the `ContentView` which print out the current display eligibility for each of the Tips:

```swift
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
```






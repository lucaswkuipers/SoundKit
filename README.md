# SoundKit
Swift framework to play sounds and haptics in a scalable and simplified way.

![Sound (819 × 375 px)-2](https://user-images.githubusercontent.com/59176579/220217148-083fa043-650b-4c2a-bd1f-99e66ddfc636.png)

# SoundKit

SoundKit is a lightweight and easy-to-use Swift package for playing sounds and haptics in your iOS app.

## Installation

You can install SoundKit using Swift Package Manager. Simply add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/SoundKit.git", from: "1.0.0")
]
```

## Usage

### SoundPlayer

`SoundPlayer` is the main class in SoundKit responsible for playing sounds. Here's how you can use it:

1. Start the sound engine by calling `SoundPlayer.start()`. It's recommended to call this method as soon as possible (e.g. in your `AppDelegate` or `SceneDelegate`) to prevent delays when playing the first sound.

2. Play a sound by calling `SoundPlayer.play(_:)`, passing in an object that conforms to the `Sound` protocol.

Here's an example:

```swift
// Start the sound engine
SoundPlayer.start()

// Play a sound
SomeSound().play()
```

You can also customize the volume and number of loops for each sound by setting the corresponding properties in your Sound object. If you want a sound to loop indefinitely, simply set the isLoop property to true.

### Sound

`Sound` is a protocol that you can adopt to define your own sounds. Here are the properties you can customize:

- `fileName`: The name of the sound file (without the extension).
- `fileExtension`: The extension of the sound file (e.g. "mp3").
- `haptic`: An optional object that conforms to the `Haptic` protocol. If provided, the haptic will be played whenever the sound is played.
- `numberOfVariations`: The number of variations of the sound file (e.g. if you have "sound.mp3" and "sound_1.mp3", set this to 2).
- `volume`: The volume of the sound (0.0 to 1.0).
- `isLoop`: Whether the sound should loop indefinitely.

Here's an example:

```swift
struct MySound: Sound {
    var fileName = "my_sound"
    var fileExtension = "mp3"
    var haptic = MyHaptic()
    var numberOfVariations = 3
    var volume: Float = 0.5
    var isLoop = true
}
```

### Haptic

`Haptic` is a protocol that you can adopt to define your own haptics. Here are the properties you can customize:

- `style`: The feedback style of the haptic.
- `intensity`: The intensity of the haptic (0.0 to 1.0).

Here's an example:

```swift
struct MyHaptic: Haptic {
    var style = .heavy
    var intensity: CGFloat = 1.0
}
```

## License

SoundKit is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

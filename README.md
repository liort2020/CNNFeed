![Swift version](https://img.shields.io/badge/Swift-%205.3-orange)
![iOS version](https://img.shields.io/badge/iOS-%2014.0-brightgreen)
![Xcode version](https://img.shields.io/badge/Xcode-%2012.0-blue)

# CNN Feed Application
This application show you news from CNN’s RSS feeds: 
1. [Travel](http://rss.cnn.com/rss/edition_travel)
2. [World Sport](http://rss.cnn.com/rss/edition_sport)
3. [Entertainment](http://rss.cnn.com/rss/edition_entertainment)

## Architecture
MVVM architecture pattern and Clean architecture with three layers:
![Screenshot](CNNFeedArchitecture.png)

- **Presenter layer**
  - contains `Views` and `FeedViewModel` (MVVM architecture pattern)
  
- **Domain layer**
  - contains use cases and connect between Presenter layer and Data layer
  - `CNNChannelModel`(`Codable`) - model that we got from the CNN server

- **Data Layer**
  - contains CoreData storage with FeedItem model
  - `DefaultDataRepository` - manage our requests to CNN server and implements `DataRepository` protocol (Strategy design pattern)
  - `MockDataManager` (For Tests) - create mock data for testing and implements `DataRepository` protocol (Strategy design pattern)
  - `Endpoint` - URLs path to connect to CNN server
  - `PersistenceController` - allow access to local storage
  - `MockPersistenceController` (For Tests) - allow access to in-memory storage for testing

### **Application**
  - `DIContainer` – help us to inject the dependencies (Factory and Dependency injection design patterns) and implements `DIContainerProtocol`
  - `MockDIContainer` (For Tests) – help us to inject the mock dependencies (Factory and Dependency injection design patterns) and implements `DIContainerProtocol`


## Dependencies - Pods
- We use [`XMLCoder`](https://github.com/MaxDesiatov/XMLCoder) that parse XML response from CNN’s RSS channel using `Codable`


## Installation
### System requirement
- iOS 14.0 or later
- Xcode 12.0 or later

### Install and Run the CNN Feed application
1. Install [`CocoaPods`](https://cocoapods.org) - This is a dependency manager for Swift and Objective-C projects for Apple's platforms. 
You can install it with the following command:

```bash
$ gem install cocoapods
```

2. Navigate to the project directory and install pods from `Podfile` with the following command:

```bash
$ pod install
```

3. Open the `CNNFeed.xcworkspace` file that was created and run it in Xcode


## Tests

### Unit Tests
Run unit tests:
1. Navigate to `CNNFeedTests` target

2. Run test from `Product` ➞ `Test` or use `⌘U` shortcuts

### UI Tests
Run UI tests:
1. Navigate to `CNNFeedUITests` target

2. Run test from `Product` ➞ `Test` or use `⌘U` shortcuts

### Screen recording 
![Screenshot](screenRecording.gif)

### Screenshots
<img src="screenshot1.PNG" width="220"> <img src="screenshot2.PNG" width="220">
<img src="screenshot3.PNG" width="220"> <img src="screenshot4.PNG" width="220">

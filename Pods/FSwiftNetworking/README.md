# FSwiftNetworking
FSwiftNetworking is a minimal HTTP networking framework that leverages the [BrightFutures library](https://github.com/Thomvis/BrightFutures).

FSwiftNetworking is a fork of [Astral](https://github.com/hooliooo/Astral) with an iOS 9.3 target

## Example
```swift
struct PokeAPIConfiguration: Configuration {

    var scheme: URLScheme {
        return URLScheme.http
    }

    var host: String {
        return "pokeapi.co"
    }

    var basePathComponents: [String] {
        return [
            "api",
            "v2"
        ]
    }

    var baseHeaders: [String : Any] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
```

```swift
struct PokemonRequest: Request {

    let id: Int

    var configuration: Configuration {
        return PokeAPIConfiguration()
    }

    var pathComponents: [String] {
        return [    
            "pokemon",
            "\(self.id)"
        ]
    }

    var method: HTTPMethod {
        return HTTPMethod.GET
    }

    var parameters: [String : Any] {
        return [:]
    }

    var headers: [String : Any] {
        return [:]
    }
}
```

```swift
let queue: DispatchQueue = DispatchQueue(label: "pokeapi", qos: DispatchQoS.userInitiated, attributes: [DispatchQueue.Attributes.concurrent])

let request: Request = PokemonRequest(id: 1)
let dispatcher: RequestDispatcher = JSONRequestDispatcher(
    request: request, builderType: JSONRequestBuilder.self, printsResponse: true
)

dispatcher.dispatchURLRequest()
    .onSuccess(queue.context) { (data: Data) -> Void in
        // Create and parse JSON
    }
    .onFailure(queue.context) { (error: NetworkingError) -> Void in
        // Handle the error
    }
    .onComplete(queue.context) { (result: Result<Data, NetworkingError>) -> Void in
        // Handle the completion of the network request
        // such as clean up of the UI
    }
```


## Requirements

    FSwiftNetworking requires iOS 9.3 or higher and Swift 3.x

## Installation

FSwiftNetworking is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# For this private cocoapod
source 'https://bitbucket.org/FFUF/ffuf-ios-architecture-fswiftnetworking.git'

# For public cocoapods
source 'https://github.com/CocoaPods/Specs.git'

target 'YOURPROJECT' do
  pod "FSwiftNetworking"
end
```

## Author

Julio Miguel Alorro, julio.alorro@ffuf.de

## License

FSwiftNetworking is available under the MIT license. See the LICENSE file for more info.

![Realm](logo.png)

Realm is a mobile database that runs directly inside phones, tablets or wearables.
This repository holds the source code for the iOS & OSX versions of Realm, for both Swift & Objective-C.


## Features

* **Mobile-first:** Realm is the first database built from the ground up to run directly inside phones, tablets and wearables.
* **Simple:** Data is directly [exposed as objects](http://realm.io/docs/ios/latest/#models) and [queryable by code](http://realm.io/docs/ios/latest/#queries), removing the need for ORM's riddled with performance & maintenance issues. Plus, we've worked hard to [keep our API down to just 3 common classes](http://realm.io/docs/ios/latest/api/) (Object, Arrays and Realms) and 1 utility class (Migrations): most of our users pick it up intuitively, getting simple apps up & running in minutes.
* **Modern:** Realm supports relationships, generics, vectorization and even Swift (experimental).
* **Fast:** Realm is faster than even raw SQLite on common operations, while maintaining an extremely rich feature set.

## Setting up Realm in your app

### Swift

Please see the [detailed instructions in our docs](http://realm.io/docs/cocoa/latest/#swift). CocoaPods does not support Swift yet.

### Objective-C

There are two ways to set up Realm in your app: manually or with CocoaPods.

**Manually:**

1. Download the [latest release of Realm](http://static.realm.io/downloads/ios/latest) and extract the zip (or [build it from source](#building-realm)).
2. Drag Realm.framework from our release and into the Frameworks folder in your project in Xcode.
   Make sure **Copy items into destination group’s folder** is selected and press **Finish**.
3. Click on the project in the Xcode file explorer.
   Select your target and go to the **Build Phases** tab. Under **Link Binary with Libraries** press + and add **libc++.dylib**.

**[CocoaPods](http://cocoapods.org/):**

1. Add the following to your Podfile: `pod "Realm"`.
2. From the command line, run `pod install`.
3. Use the `.xcworkspace` file generated by CocoaPods to work on your project!

Once your app is set up with Realm, our [documentation](#documentation) will guide you to unleash its full potential.

## Documentation

Documentation for Realm can be found at [realm.io/docs/cocoa/latest](http://realm.io/docs/cocoa/latest). The API reference is located at [realm.io/docs/cocoa/latest/api](http://realm.io/docs/cocoa/latest/api).

## Building Realm

In case you don't want to use the precompiled version, you can build Realm yourself.

Prerequisites:

* Building Realm requires Xcode 5 or above
* Building Realm with Swift support requires Xcode6-Beta5 specifically
* Building Realm documentation requires [appledoc](https://github.com/tomaz/appledoc)

Once you have all the necessary prerequisites, building Realm.framework just takes a single command: `sh build.sh ios`. You'll need an internet connection the first time you build Realm to download the core binary.

Run `sh build.sh help` to see all the actions you can perform (build ios/osx, generate docs, test, etc.).

Executing the examples under the /examples folder, requires that you have built the Realm.framework.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

## License

Realm Cocoa is published under the Apache 2.0 license.  
The underlying core is available under the [Realm Core Binary License](https://github.com/realm/realm-cocoa/blob/master/LICENSE#L210-L243) while we [work to open-source it under the Apache 2.0 license](http://realm.io/docs/cocoa/latest/#faq).

## Feedback

**_If you use Realm and are happy with it, all we ask is that you please consider sending out a tweet mentioning [@realm](http://twitter.com/realm), announce your app on [our mailing-list](https://groups.google.com/forum/#!forum/realm-users), or email [info@realm.io](mailto:info@realm.io) to let us know about it!_**

**_And if you don't like it, please let us know what you would like improved, so we can fix it!_**

![analytics](https://ga-beacon.appspot.com/UA-50247013-2/realm-cocoa/README?pixel)

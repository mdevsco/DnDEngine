//
//  BundleExtensions.swift
//
//  This was taken from HakingWithSwift.com
//  https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way
//
//  Created by Rodney Aiglstorfer on 9/5/22.
//

import Foundation

extension Bundle {
    /// If you want to load some JSON from your app bundle when your app runs, it takes
    /// quite a few lines of code: you need to get the URL from your bundle, load it into a
    /// Data instance, try decoding it, then catch any errors.
    ///
    /// It’s such a common thing to do that I have an extension to make the process easier.
    /// I’ll show you the code first, then explain how it works.
    ///
    /// To use the extension, you need some sort of codable struct, such as this one:
    /// ```swift
    /// struct User: Codable {
    ///   var name: String
    /// }
    /// ```
    /// You also need some sort of JSON in your app bundle. For example, a file called
    /// data.json containing contents like this:
    /// ```json
    /// {
    ///   "name": "Taylor Swift"
    /// }
    /// ```
    ///
    /// And now you can load your JSON into your struct in just a single line of code:
    /// ```swift
    /// let user = Bundle.main.decode(User.self, from: "data.json")
    /// ```
    ///
    /// The extension is capable of loading any kind of decodable data – your structs,
    /// arrays of your structs, and so on. Even better, you can use it to make properties
    /// in your types immutable and available as soon as your types are created, like this:
    ///
    /// ```swift
    /// class ViewController: UIViewController {
    ///    let menuItems = Bundle.main.decode([MenuItem].self, from: "menu.json")
    ///    // the rest of your code…
    /// }
    /// ```

    public func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

//
//  File.swift
//  swift-argument-parser
//
//  Created by atesillos on 11/25/24.
//  Initial code by Jomy10 on GitHub.
//

import Foundation
import ArgumentParser

// Main struct
@main
struct Main: ParsableCommand {
    // TODO: Fix this error
    // "Missing argument for parameter 'from' in call"
  var property: MyCustomDecodableStruct = MyCustomDecodableStruct()
}

// Argument
struct MyCustomDecodableStruct: Decodable {
    enum CodingKeys: String, CodingKey {
        case input
        case output
    }
    enum InputCodingKeys: String, CodingKey {
        case inputLanguage = "language"
    }
    enum OutputCodingKeys: String, CodingKey {
        case outputLanguage = "language"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // TODO: add these things
        // "Initialization of immutable value 'input' was never used; consider replacing with assignment to '_' or removing it"
        let input = try container.nestedContainer(keyedBy: InputCodingKeys.self, forKey: .input)
        // "Initialization of immutable value 'output' was never used; consider replacing with assignment to '_' or removing it"
        let output = try container.nestedContainer(keyedBy: OutputCodingKeys.self, forKey: .output)
    /* rest of the implementation */
  }
    func run() {
        print("Done")
    } // Run func
} // Parsabale Command

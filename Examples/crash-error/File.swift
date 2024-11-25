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
        let input = try container.nestedContainer(keyedBy: InputCodingKeys.self, forKey: .input)
        let output = try container.nestedContainer(keyedBy: OutputCodingKeys.self, forKey: .output)
    /* rest of the implementation */
  }
}

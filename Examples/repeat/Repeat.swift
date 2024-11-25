//===----------------------------------------------------------*- swift -*-===//
//
// This source file is part of the Swift Argument Parser open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import ArgumentParser

@main
// makes parsers object
struct Repeat: ParsableCommand {
    /*
     The different Args
     
     > COUNT
     I've figured out that if the Int type CAN or WILL be nil, you need to have ?
     ? means the variable is an OPTIONAL type!
     This means it needs to be nil or a number. It cannot contain anything else.
     */
    @Option(help: "The number of times to repeat 'phrase'.")
    var count: Int? = nil

    /*
     > COUNTER
     This one is an argument to see if there should be a counter included.
     Although I do not fully understand right now, changing this to 'true' throws an error.
     */
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false

    @Argument(help: "The phrase to repeat.")
    // TODO: Remove Hello World.
    // Added Hello World to see if it would print if there was a phrase
    var phrase: String = "Hello, World!"

    /*
     The run() func is like the main method of the file
     It has the process that is needed.
     */
    mutating func run() throws {
        // Changing the number after '??' will change the amount of times it prints
        // Seems as if the ?? is to help with the 'optional' nil type of 'Int?'
        let repeatCount = count ?? 2

        for i in 1...repeatCount {
            if includeCounter {
                print("\(i): \(phrase)")
            } else {
                print(phrase)
            }
        }
    }
}

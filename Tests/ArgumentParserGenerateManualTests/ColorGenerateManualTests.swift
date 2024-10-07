//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import XCTest
import ArgumentParserTestHelpers

final class ColorGenerateManualTests: XCTestCase {
  func testEumerableOptionValue_SinglePageManual() throws {
    try AssertGenerateManual(multiPage: false, command: "color", expected: #"""
      .\" "Generated by swift-argument-parser"
      .Dd May 12, 1996
      .Dt COLOR 9
      .Os
      .Sh NAME
      .Nm color
      .Sh SYNOPSIS
      .Nm
      .Fl -fav Ar fav
      .Op Fl -second Ar second
      .Op Fl -help
      .Sh DESCRIPTION
      .Bl -tag -width 6n
      .It Fl -fav Ar fav
      Your favorite color.
      .Pp
      .Bl -tag -width 6n
      .It red
      A red color.
      .It blue
      A blue color.
      .It yellow
      A yellow color.
      .El
      .It Fl -second Ar second
      Your second favorite color.
      .Pp
      This is optional.
      .Bl -tag -width 6n
      .It red
      A red color.
      .It blue
      A blue color.
      .It yellow
      A yellow color.
      .El
      .It Fl h , -help
      Show help information.
      .El
      .Sh AUTHORS
      The
      .Nm
      reference was written by
      .An -nosplit
      .An "Jane Appleseed" ,
      .Mt johnappleseed@apple.com ,
      and
      .An -nosplit
      .An "The Appleseeds"
      .Ao
      .Mt appleseeds@apple.com
      .Ac .
      """#)
  }

  func testEnumerableOptionValue_MultiPageManual() throws {
    try AssertGenerateManual(multiPage: true, command: "color", expected: #"""
      .\" "Generated by swift-argument-parser"
      .Dd May 12, 1996
      .Dt COLOR 9
      .Os
      .Sh NAME
      .Nm color
      .Sh SYNOPSIS
      .Nm
      .Fl -fav Ar fav
      .Op Fl -second Ar second
      .Op Fl -help
      .Sh DESCRIPTION
      .Bl -tag -width 6n
      .It Fl -fav Ar fav
      Your favorite color.
      .Pp
      .Bl -tag -width 6n
      .It red
      A red color.
      .It blue
      A blue color.
      .It yellow
      A yellow color.
      .El
      .It Fl -second Ar second
      Your second favorite color.
      .Pp
      This is optional.
      .Bl -tag -width 6n
      .It red
      A red color.
      .It blue
      A blue color.
      .It yellow
      A yellow color.
      .El
      .It Fl h , -help
      Show help information.
      .El
      .Sh AUTHORS
      The
      .Nm
      reference was written by
      .An -nosplit
      .An "Jane Appleseed" ,
      .Mt johnappleseed@apple.com ,
      and
      .An -nosplit
      .An "The Appleseeds"
      .Ao
      .Mt appleseeds@apple.com
      .Ac .
      """#)
  }
}
/*
 Copyright (c) 2019 halo. https://github.com/halo/macosvpn

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

extension VPNServiceConfig {
  enum Splitter {
    /// Splits an Array of arguments into one array per VPN service
    static func parse(_ arguments: [String]) -> [VPNServiceConfig] {
      let delimiters = Set(arrayLiteral: "--l2tp", "--cisco")

      let slices =  arguments.split(before: delimiters.contains)
        .drop(while: { $0.isEmpty })

      var result: [VPNServiceConfig] = []
      for slice in slices {
        result.append(VPNServiceConfig.Parser.parse(Array(slice)))
      }
      return result
    }
  }
}
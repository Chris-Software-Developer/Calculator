//
//  Extensions.swift
//  Calculatron
//
//  Created by Christopher Smith on 11/18/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import Foundation

extension Double {
    var wholeNumber: Bool {
        return self.truncatingRemainder(dividingBy: 1) == 0
    }
}

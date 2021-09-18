//
//  Array+Only.swift
//  Concentration
//
//  Created by Steve Liddle on 9/17/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

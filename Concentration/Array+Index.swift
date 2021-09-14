//
//  Array+Index.swift
//  Array+Index
//
//  Created by Steve Liddle on 9/9/21.
//

import Foundation

extension Array where Element: Identifiable {
    // TODO: There's a subtle naming issue here.  We could do a better
    // job describing what's realling happening in this method.  In
    // general, there could be multiple elements in an array that match
    // the element we're looking for, and we're really just going to
    // return the first match.  This suggests "firstIndex(matching:)"
    // for this method.  Should we also rename the file?
    func index(of targetElement: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == targetElement.id {
                return index
            }
        }

        return nil
    }
}

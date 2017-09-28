//
//  ListItem.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import Foundation

struct ListItem: Equatable {
    var id: Int
    var title: String

    // MARK: Equatable

    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
    }
}

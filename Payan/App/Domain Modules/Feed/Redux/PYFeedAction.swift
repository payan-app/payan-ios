//
//  PYFeedAction.swift
//  Payan
//
//  Created by Juan David Hurtado Molano on 8/12/22.
//

import Foundation

enum PYFeedAction {
    case updateTitle
    case getData
    case showData(PYFeedPageData)
    case loadStory(id: String, index: Int)
    case showStory(PYStoryData)
    case storyErrorOccured
    case feedErrorOccured
    case saveStory(hash: String)
}

//
//  Project.swift
//  Crochet Tracker
//
//  Created by Maithili Nadig on 7/20/26.
//

import Foundation

struct Project: Identifiable {

    let id = UUID()

    let title: String
    let category: String
    let difficulty: String
    let description: String
    let youtubeURL: String

}

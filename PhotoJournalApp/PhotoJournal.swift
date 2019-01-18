//
//  PhotoJournal.swift
//  PhotoJournalApp
//
//  Created by Nathalie  on 1/16/19.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import UIKit

struct Photo: Codable {
    let photoData: Data
    let photoTitle: String
    let photoDescription: String
    let createdAt: String
    public var dateFormattedString: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = createdAt
        if let date = isoDateFormatter.date(from: createdAt) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: createdAt) {
            formattedDate = date
        }
        return formattedDate
    }
}







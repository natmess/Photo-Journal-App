//
//  DataPersistenceManager.swift
//  PhotoJournalApp
//
//  Created by Nathalie  on 1/16/19.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}

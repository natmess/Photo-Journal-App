//
//  JournalModel.swift
//  PhotoJournalApp
//
//  Created by Nathalie  on 1/16/19.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import Foundation

final class PhotoJournalModel {
    private static let fileName = "PhotoJournalList.plist"
    private init() {}
    static func getPhotoJournal() -> Photo?{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        var photoJournal: Photo?
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    photoJournal =  try PropertyListDecoder().decode(Photo.self, from: data)
                } catch {
                    print("deccoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(fileName) does not exist")
        }
        return photoJournal
    }
    
    static func savePhotoJournal(photoJournal: Photo){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(photoJournal)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("encoding error")
        }
    }
}



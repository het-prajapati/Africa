//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Het Prajapati on 5/19/21.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Create a property for the Data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle ")
        }
    
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) in bundle")
        }
        
        // 5. Return the ready-to-use data
        return loaded
        
    }
}

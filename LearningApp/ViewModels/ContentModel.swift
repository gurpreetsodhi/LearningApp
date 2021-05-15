//
//  ContentModel.swift
//  LearningApp
//
//  Created by Sodhis on 4/13/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: - Data Methods
    func getLocalData() {
            
            // Get a url to the json file
            let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
            
            do {
                // Read the file into a data object
                let jsonData = try Data(contentsOf: jsonUrl!)
                
                // Try to decode the json into an array of modules
                let jsonDecoder = JSONDecoder()
                let modules = try jsonDecoder.decode([Module].self, from: jsonData)
                
                // Assign parsed modules to modeules property
                self.modules = modules
                
            }
            catch {
                // Log error
                print("Couldn't decode Json")
            }
            
            // Get a url to the style data
            let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
            
            do {
                // Read the fule into a data object
                let styleData = try Data(contentsOf: styleUrl!)
                
                self.styleData = styleData
                
            }
            catch {
                print("Couldn't parse style data")
            }
            
        }

    // MARK: - Data Navigation Methods
    func beginModule(moduleId: Int) {
        
        // Find the index for the module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                
                //Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current Module
        currentModule = modules[currentModuleIndex]
        
    }
}

//
//  ContentView.swift
//  LearningApp
//
//  Created by Sodhis on 5/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                if model.currentModule != nil {
                    
                    ForEach (0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(
                            destination: ContentDetailView().onAppear(perform: {
                                model.beginLesson(lessonIndex: index)
                            }),
                            label: {
                                ContentViewRow(index: index)

                            })
                        
                    }
                }

            }
            .accentColor(.black)
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}



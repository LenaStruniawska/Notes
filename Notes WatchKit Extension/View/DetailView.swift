//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Slawek on 15/12/2022.
//

import SwiftUI

struct DetailView: View {
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            // HEADER
            HeaderView(title: "")
            //CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        Settings()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            } // HSTACK
            .foregroundColor(.secondary)
        } // VSTACK
        .padding(3)
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
static var sampleData: Note = Note(id: UUID(), text: "Hello World")

    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}

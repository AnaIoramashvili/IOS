//
//  ContentView.swift
//  EmojiLover
//
//  Created by Ana on 3/15/23.
//

import SwiftUI

enum Emoji: String, CaseIterable {
    case sparkle = "✨"
    case tulip = "🌷"
    case kiss = "💋"
    case hug = "🫂"
}


struct ContentView: View {
    @State var selection: Emoji = .kiss
    @State var isDarkModeEnabled = false
    @State var sentence = ""
    
    var body: some View{
        NavigationView{
            VStack{
                Text(selection.rawValue)
                    .font(.system (size: 150))
                
                Picker("SelectEmoji", selection: $selection){
                    ForEach(Emoji.allCases, id: \.self){ emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Enter a sentence", text: $sentence)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                    .padding(.bottom)
                
                Button(action: {
                    let output = "\(sentence) \(selection.rawValue)"
                    print(output)
                }) {
                    Text("Enter")
                }
                .padding(.top)

                if !sentence.isEmpty {
                    Text("\(sentence) \(selection.rawValue)")
                        .font(.system(size: 50))
                        .padding()
                }


                
                Spacer()
                
                Toggle(isOn: $isDarkModeEnabled) {
                    if isDarkModeEnabled {
                        Text("🌙")
                    } else {
                        Text("☀️")
                    }
                    Text("Dark Mode")
                }
                .padding(.bottom)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text("I'm Emoji Lover!")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                }
            }
            .padding()
            .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}




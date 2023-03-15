//
//  ContentView.swift
//  Jokes
//
//  Created by Ana on 3/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var joke = ""
    
    var body: some View {
        VStack {
            Text(joke)
                .padding()
                .foregroundColor(Color.white)
            Button("Get Random Joke") {
                fetchRandomJoke()
            }
        }
        .onAppear {
            fetchRandomJoke()
        }
        .background(Color.black)
    }
    
    func fetchRandomJoke() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            guard let joke = parseJSON(data: data) else {
                print("Error parsing JSON")
                return
            }
            
            DispatchQueue.main.async {
                self.joke = joke
            }
        }
        
        task.resume()
    }
    
    func parseJSON(data: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(JokeResponse.self, from: data)
            return response.value
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}

struct JokeResponse: Codable {
    let value: String
}

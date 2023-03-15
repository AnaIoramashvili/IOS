//
//  ViewController.swift
//  Jokes
//
//  Created by Ana on 3/15/23.
//

import UIKit

func fetchRandomJoke() {
    let url = URL(string: "https://api.chucknorris.io/jokes/random")!
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error fetching joke: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            let joke = json["value"] as! String
            print(joke)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }.resume()
}


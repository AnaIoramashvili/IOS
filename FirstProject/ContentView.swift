//
//  ContentView.swift
//  FirstProject
//
//  Created by Ana on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        Button("Tap On It") {
            print("Hello world!")
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
        
        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
        }
            Image("anachka 1")
                .resizable(resizingMode: .stretch)
                .frame(width: 320.0, height: 500.0)
                .cornerRadius(30)
            Text("cute plant")
                .bold()
                .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

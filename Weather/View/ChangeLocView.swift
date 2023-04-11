//
//  ChangeLocView.swift
//  Weather
//
//  Created by Felix Hennerich on 13.01.23.
//

import SwiftUI

struct ChangeLocView: View {
    @FocusState private var StateIsFocused: Bool
    @State private var selectedItem: Int? = nil
    @State public var location: String = ""
    @Binding var showSettingsView: Bool
    @Binding var showLocationView: Bool
    @Binding var isNight: Bool
    @Binding var refresh: Int
    
    
    var body: some View {
        NavigationView{
        ZStack{
                backgroundView(isNight: isNight, refresh: 0)
            VStack(){
                Spacer()
                
                TextField(text: $location, prompt: Text("Location:  (Now : \(name))").font(.system(size: 20, weight: .medium, design: .default)).foregroundColor(.gray)){
                    
                }.frame(width: 300, height: 100)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .onSubmit {
                        getNewLocationData(city: location)
                        hideKeyboard()
                        StateIsFocused = false
                        sleep(1)
                        getData()
                        showSettingsView.toggle()
                        showLocationView.toggle()
                        sleep(1)
                        getData()
                        sleep(1)
                        print("refresh main page .-..")
                        refresh += 2
                        
                    }.submitLabel(.search)
                    .focused($StateIsFocused)
                
                Spacer()
                Button(action: {
                    getNewLocationData(city: self.location)
                    sleep(1)
                    hideKeyboard()
                    StateIsFocused = false
                    showSettingsView.toggle()
                    showLocationView.toggle()
                    sleep(1)
                    getData()
                    sleep(1)
                    print("refresh main page .-..")
                    refresh += 2
                }, label: {
                    HStack{
                        Spacer()
                        Text("Change Location").foregroundColor(isNight ? Color.white : Color.black).bold()
                        Spacer()
                    }.accentColor(Color.black)
                        .padding()
                        .background(isNight ? Color(UIColor.darkGray) : Color("darkblue"))
                        .cornerRadius(4.0)
                        .padding(Edge.Set.vertical, 20)
                })
                    
                    Spacer()
                }
            }
        }
        
    }
}


//
//  SettingsView.swift
//  Weather
//
//  Created by Felix Hennerich on 15.02.23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var showNextViewSettings = false
    @Binding var showNextView: Bool
    @Binding var isNight: Bool
    
    var body: some View {
        ScrollView{
            ZStack{
                Spacer()
                VStack(spacing: 30){
                    HStack{
                        Text("Settings").font(.system(size: 32, weight: .bold, design: .default)).padding(30).foregroundColor(.white)
                    }.frame(width: screenWidth, height: 100)
                        .opacity(1)
                    Button(action: {
                        self.showNextViewSettings = true
                    }, label: {
                        Text("Change location").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                    }).sheet(isPresented: $showNextViewSettings) {
                        ChangeLocView(showSettingsView: $showNextViewSettings, showLocationView: $showNextView, isNight: $isNight).presentationDetents([.medium, .large]).navigationBarBackButtonHidden()
                    }
                    
                    Button(action: {
                        isNight.toggle()
                        self.showNextView = false
                    }, label: {
                        Text("Change Color Mode").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                    })

                }
                Spacer()
            }
        }.background(LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkerblue"), isNight ? Color("lightgray") : Color("lightblue")]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                     .edgesIgnoringSafeArea(.all)).ignoresSafeArea(.all)
    }
}

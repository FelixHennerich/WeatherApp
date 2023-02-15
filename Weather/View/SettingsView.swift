//
//  SettingsView.swift
//  Weather
//
//  Created by Felix Hennerich on 15.02.23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showNextView = false
    
    var body: some View {
        ScrollView{
            ZStack{
                Spacer()
                VStack{
                    HStack{
                        Text("Settings").foregroundColor(.white).font(.system(size: 32, weight: .bold, design: .default)).padding(30)
                    }.frame(width: screenWidth, height: 100)
                        .opacity(1)
                    Button(action: {
                        self.showNextView = true
                    }, label: {
                        Text("Change location")
                    }).sheet(isPresented: $showNextView) {
                        ChangeLocView().presentationDetents([.medium, .large]).navigationBarBackButtonHidden()
                    }

                }
                Spacer()
            }
        }.background(LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkerblue"), isNight ? Color("lightgray") : Color("lightblue")]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                     .edgesIgnoringSafeArea(.all)).ignoresSafeArea(.all)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

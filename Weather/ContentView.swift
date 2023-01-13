//
//  ContentView.swift
//  Weather
//
//  Created by Felix Hennerich on 08.01.23





//

import SwiftUI

public var isNight = true

struct ContentView: View {
    
    @State public var location: String = ""
    @State public var refresh = 0
    @FocusState private var StateIsFocused: Bool


    var body: some View {
        ZStack {
            backgroundView(isNight: isNight, refresh: refresh)
            VStack{
                Text("\(name), \(country)")
                    .font(.system(size: 32 , weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 30){
                    getImage(iconId: icon).renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("\(temp)°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(Color.white)
                }.padding(.bottom , 40)
                HStack(spacing: 12){
                    DaysView(dayname: "Min.",
                             imagename: "thermometer.low",
                             temp: temp_min)
                    DaysView(dayname: "Max.",
                             imagename: "thermometer.high",
                             temp: temp_max)
                }
                Spacer()
                
                HStack(){
                    TextField(text: $location, prompt: Text("Location:  (Now : \(name))").font(.system(size: 20, weight: .medium, design: .default)).foregroundColor(.gray)){
                        
                    }.frame(width: 300, height: 100)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .onSubmit {
                            getNewLocationData(city: location)
                            sleep(1)
                            getData()
                            hideKeyboard()
                            refresh+=1
                            StateIsFocused = false
                        }
                        .focused($StateIsFocused)
                }
                Button{
                    refresh+=1;
                }label: {
                    Text("Update").foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
                }
                Spacer()
            }
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DaysView: View {
    
    var dayname: String
    var imagename: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayname)
                .font(.system(size: 28))
                .foregroundColor(.white)
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    
    var isNight: Bool
    var refresh: Int
    
    var body: some View {
        Text("\(refresh)")
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkerblue"), isNight ? Color("lightgray") : Color("lightblue")]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

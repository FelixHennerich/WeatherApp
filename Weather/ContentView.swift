//
//  ContentView.swift
//  Weather
//
//  Created by Felix Hennerich on 08.01.23





//

import SwiftUI


struct ContentView: View {
    

    @State public var isNight = true

    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight)
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
                }.padding(.bottom , 70)
                HStack(spacing: 12){
                    DaysView(dayname: "Tue",
                             imagename: "smoke.fill",
                             temp: 12)
                    DaysView(dayname: "Wen",
                             imagename: "smoke.fill",
                             temp: 13)
                    DaysView(dayname: "Thu",
                             imagename: "smoke.fill",
                             temp: 18)
                    DaysView(dayname: "Fri",
                             imagename: "cloud.sun.fill",
                             temp: 19)
                    DaysView(dayname: "Sat",
                             imagename: "sun.max.fill",
                             temp: 25)
                    DaysView(dayname: "Sun",
                             imagename: "sun.max.fill",
                             temp: 19)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    Text("Change Day time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20)
                }
                Button{
                    print("nothing here")
                }label: {
                    Text("Print Weather")
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20)
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
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkerblue"), isNight ? Color("lightgray") : Color("lightblue")]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

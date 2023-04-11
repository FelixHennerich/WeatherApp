//
//  ContentView.swift
//  Weather
//
//  Created by Felix Hennerich on 08.01.23





//

import SwiftUI
import UIKit

/**
 Mainscreen View (Weather)
 */
struct ContentView: View {
    
    @FocusState private var StateIsFocused: Bool
    @State var selection: Int? = nil
    @State var showNextView = false
    @State var refresh = 0
    @ObservedObject var isNightvalue = isNight()




    var body: some View {
            NavigationView{
                RefreshableScrollView{
                    ZStack {
                        VStack{
                            HStack{
                                Button(action:{
                                    self.showNextView = true
                                    getHTTP()
                                }, label: {
                                    Image(systemName: "gear").renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .position(x: screenWidth-61, y: 80)
                                }).sheet(isPresented: $showNextView) {
                                    SettingsView(showNextView: $showNextView, isNight: $isNightvalue.isNightValue, refresh: $refresh).presentationDetents([.medium, .large]).navigationBarBackButtonHidden()
                                }
                            }
                            Text("\(refresh)").font(.system(size: 1, weight: .ultraLight, design: .default)).foregroundColor(isNightvalue.isNightValue ? .black : Color("darkblue")).padding(.bottom, 50)
                            Text("\(name), \(country)")
                                .font(.system(size: 32 , weight: .medium, design: .default))
                                .foregroundColor(.white)
                                .padding(30)
                            VStack(spacing: 50){
                                getImage(iconId: icon).renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                Text("\(temp)°")
                                    .font(.system(size: 70, weight: .medium))
                                    .foregroundColor(Color.white)
                            }.padding(.bottom , 50)
                            HStack(spacing: 12){
                                DaysView(dayname: "Min.",
                                         imagename: "thermometer.low",
                                         temp: temp_min)
                                DaysView(dayname: "Max.",
                                         imagename: "thermometer.high",
                                         temp: temp_max)
                            }
                            HStack{
                                Spacer()
                            }

                        }
                }
            } onRefresh: {
                getData()
                sleep(1)
                print("refresh main page .-..")
                refresh += 2
            }.background(LinearGradient(gradient: Gradient(colors: [isNightvalue.isNightValue ? .black : Color("darkerblue"), isNightvalue.isNightValue ? Color("lightgray") : Color("lightblue")]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing)
                         .edgesIgnoringSafeArea(.all)).ignoresSafeArea(.all)
        }
    }
}

/**
 Preview method
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/**
 Boolean of dark/light mode
 */
class isNight: ObservableObject{
    @Published var isNightValue = CheckBackground()
}

/**
 Refreshale Scroll View
 */
public struct RefreshableScrollView<Content: View>: View {
    var content: Content
    var onRefresh: () -> Void

    public init(content: @escaping () -> Content, onRefresh: @escaping () -> Void) {
        self.content = content()
        self.onRefresh = onRefresh
    }

    public var body: some View {
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            onRefresh()
        }
    }
}

/**
 Day view for several days
 */

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

/**
 Background color gradient
 */

struct backgroundView: View {
    
    var isNight: Bool
    var refresh: Int
    
    var body: some View {
        Text("\(refresh)")
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkerblue"), isNight ? Color("lightgray") : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

/**
 Hidekeyboard extension
 */
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

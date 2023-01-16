//
//  RequestLocalDataView.swift
//  Weather
//
//  Created by Felix Hennerich on 16.01.23.
//

import SwiftUI

struct LocalDataView: View {
    var body: some View {
        ZStack(){
            VStack{
                Spacer()
                Text("ABCD")
                Spacer()
                Button(action: {
                    
                }, label:{
                    Text("Request local data").foregroundColor(.black).font(.system(size: 30, weight: .bold, design: .default))
                })
                Spacer()
            }
        }
    }
}

struct LocalDataView_Previews: PreviewProvider {
    static var previews: some View {
        LocalDataView()
    }
}

//
//  ContentView.swift
//  Reminder
//
//  Created by 从径源 on 2023/3/12.
//

import SwiftUI

struct ContentView: View {
    @State var input:String = ""
    var body: some View {
        VStack{
            SearchBarView(input: $input)
            VStack{
                HStack{
                    CardView(isFaceUP: true)
                    CardView(isFaceUP: false)
                }
                .padding(9.0)
                HStack{
                    CardView(isFaceUP: true)
                    CardView(isFaceUP: false)
                }
                .padding(9.0)
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
        }
    }
}


struct SearchBarView: View {
    @Binding var input:String
    var body: some View{
        TextField("搜索", text: $input)
            .padding(7)
            .padding(.horizontal,25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading).padding(.leading,8)
            )
    }
}

struct CardView:View{
    var isFaceUP:Bool
    var body: some View{
        ZStack(alignment: .center ){
            if isFaceUP{
                RoundedRectangle(cornerRadius: 25)
                    .fill()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 5).fill()
                Text("🥰")
                    .font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 25)
                    .fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}


//
//  ContentView.swift
//  Reminder
//
//  Created by 从径源 on 2023/3/12.
//

import SwiftUI

struct ContentView: View {
    @State var input:String = ""
    var emojis = ["🐵","🙈","🙉","🙊","🐅","🐍","🪲","🐊","🦛","🐎","🐓","🐈‍⬛","🦣","🦑","🪲","🦟","🦤","🦔","🍄","🪨"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
//            SearchBarView(input: $input)
            VStack{
                Text("Memorize!")
                    .font(.largeTitle)
                SearchBarView(input: $input)
            }
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount],id:\.self,content: {
                        emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            .scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                remove
                Spacer()
                Text("Shape")
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove:some View{
        Button{
            if emojiCount > 1{
                emojiCount-=1
            }
        }label: {
            Image(systemName: "minus.circle")
//            Text("hello")
        }
        
    }
    
    var add:some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount+=1
            }
        }label: {
           Image(systemName: "plus.circle")
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
    var content:String
    @State var isFaceUP:Bool = true
    var body: some View{
        ZStack(alignment: .center ){
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUP{
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUP.toggle()
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


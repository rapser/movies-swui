//
//  ContentView.swift
//  movies-swui
//
//  Created by miguel tomairo on 5/8/20.
//  Copyright © 2020 Rapser. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var show = false
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack{
            
                VStack(alignment: .leading, spacing : 15) {
                    
                    Text("Browse").font(.largeTitle)
                    
                    Button(action: {
                        
                    }) {
                        HStack(spacing: 8) {
                            
                            Text("Movies in New York")
                            Image(systemName: "chevron.down").font(.body)
                        }
                    }.foregroundColor(.black)
                }
                    
                Spacer()
                    
                Button(action: {
                    
                }) {
                    
                    Image("menu").renderingMode(.original)
                }
                    
            }.padding(.top, 15)
            
            SearchView().padding(.vertical, 15)
            
            HStack{
                
                Text("All Movies")
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 10){
                        
                        Text("Filter")
                        Image("filter").renderingMode(.original)
                    }
                    
                }.foregroundColor(.black)
                
            }.padding(.bottom, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    
                    ForEach(datas){i in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 15){
                                
                                ForEach(i.row){j in
                                    
                                    VStack(alignment: .leading, spacing: 12){
                                        
                                        Image(j.image).onTapGesture {
                                            
                                            self.show.toggle()
                                        }
                                        
                                        Text(j.name).font(.caption).lineLimit(1)
                                        Text(j.time).font(.caption)
                                        
                                    }.foregroundColor(Color.black.opacity(0.5))
                                    .frame(width: 135)
                                    
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }.padding(.horizontal, 15)
        .sheet(isPresented: $show) {
            
            Detail()
                
        }
        
    }
}

struct Detail: View {
    
    @State var selected = "23"
    
    var body: some View {
        
        VStack{
            Image("header").resizable().aspectRatio(1, contentMode: .fill)
                .frame(height: 350)
            
            VStack{
                
                VStack(spacing: 15){
                    
                    Text("Ant a man the wasap").foregroundColor(.black)
                    
                    HStack(spacing: 15){
                        
                        HStack{
                            
                            Image(systemName: "star.fill").font(.caption)
                            Text("4.9")
                        }
                        
                        HStack{
                            
                            Image("clock")
                            Text("11min")
                        }
                        
                        HStack{
                            
                            Image("film")
                            Text("IMAX")
                        }
                    }
                    
                    Divider().padding(.vertical, 15)
                    Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters").font(.caption)
                    
                }.padding()
                .background(Color("Color"))
                .foregroundColor(Color.black.opacity(0.5))
                .cornerRadius(25)
                
                HStack{
                    
                    ForEach(dates){i in
                        Button(action: {
                            self.selected = i.date
                        }) {
                            
                            VStack(spacing: 10){
                                Text(i.day)
                                Text(i.date)
                            }.padding()
                            
                        }.foregroundColor(self.selected == i.date ? Color.white: Color.gray)
                        .background(self.selected == i.date ? Color.blue : Color.clear)
                        .cornerRadius(10)
                    }
                }.padding(.vertical, 25)
                
                HStack(spacing: 15){
                    
                    Text("$23")
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Book New").padding(.vertical, 15).padding(.horizontal, 35)
                    }.foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                }.padding(.top, 15)
                
                Spacer()
                
                
            }.padding(.horizontal, 25)
                .padding(.top, -35)
        }
        
    }
}

struct SearchView: View {
    
    @State var txt = ""
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(systemName: "magnifyingglass").font(.body)
            TextField("Search Movies", text: $txt)
            
        }.padding()
        .foregroundColor(.black)
        .background(Color("Color"))
        .cornerRadius(25)
        
    }
}


struct type : Identifiable {
    
    var id: Int
    var row: [row]
}

struct row: Identifiable {
    
    var id: Int
    var name: String
    var time: String
    var image: String
}

struct dateType: Identifiable {
    
    var id: Int
    var date: String
    var day: String
}

var datas = [type(id: 0, row: [
row(id: 0, name: "Jurassic World", time: "1h 20m", image: "r01"),
row(id: 1, name: "Ocean 8", time: "1h 42m", image: "r02"),
row(id: 2, name: "Veon", time: "2h 40m", image: "r03")
]),
type(id: 1, row: [
row(id: 0, name: "The spy who dumped me", time: "1h 12m", image: "r04"),
row(id: 1, name: "The Equalizer", time: "1h 42m", image: "r05"),
row(id: 2, name: "Mamma Mia", time: "1h 24m", image: "r06")
]),
type(id: 2, row: [
row(id: 0, name: "The spy who dumped me", time: "1h 12m", image: "r07"),
row(id: 1, name: "The Equalizer", time: "1h 42m", image: "r08"),
row(id: 2, name: "Mamma Mia", time: "1h 24m", image: "r09")
])
]

var dates = [dateType(id: 0, date: "23", day: "Mon"),
dateType(id: 1, date: "24", day: "Tue"),
dateType(id: 2, date: "25", day: "Wed"),
dateType(id: 3, date: "26", day: "Thu"),
dateType(id: 4, date: "27", day: "Fri")
]

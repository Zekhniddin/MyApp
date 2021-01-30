//
//  HomeScreen.swift
//  MyApp
//
//  Created by Зехниддин on 30/01/21.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var status: Status
    
    @State private var valueProgress = 300.0
    @State private var selected = 0
    
    let color = Color(red: 221 / 255, green: 221 / 255, blue: 243 / 255)
    
    var body: some View {
        ZStack {
            color
            
            VStack(spacing: 0) {
                HStack {
                    Image("ic_user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome back, Marvin")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        Text("Your finicial situatioin in looking good!")
                            .foregroundColor(.secondary)
                            .font(.system(size: 15, design: .rounded))
                    }
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "key")
                        status.listen()
                    }) {
                        Image("ic_more")
                            .padding(.bottom, 42)
                    }
                    
                }
                .padding(.horizontal)
                .frame(height: 70)
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    ProgressView(value: valueProgress, total: 500)
                        .accentColor(Color.blue)
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                    HStack {
                        Text("Beginner Level")
                            .foregroundColor(.secondary)
                            .font(.system(size: 12))
                        Spacer()
                        Text("XP 300/500")
                            .foregroundColor(.black)
                            .opacity(0.8)
                            .font(.system(size: 14, design: .default))
                    }
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                HStack(alignment: .top) {
                    Button(action: {
                        selected = 0
                    }) {
                        if selected == 0 {
                            Text("Today")
                                .padding(.bottom, 8)
                                .background(color)
                                .padding(.bottom, 3)
                                .background(Color.red)
                        } else {
                            Text("Today")
                        }
                    }
                    Spacer()
                    Button(action: {
                        selected = 1
                    }) {
                        if selected == 1 {
                            Text("Monthly")
                                .padding(.bottom, 8)
                                .background(color)
                                .padding(.bottom, 3)
                                .background(Color.red)
                        } else {
                            Text("Monthly")
                        }
                    }
                    Spacer()
                    Button(action: {
                        selected = 2
                    }) {
                        if selected == 2 {
                            Text("Yearly")
                                .padding(.bottom, 8)
                                .background(color)
                                .padding(.bottom, 3)
                                .background(Color.red)
                        } else {
                            Text("Yearly")
                        }
                    }
                    Spacer()
                    Button(action: {
                        selected = 3
                    }) {
                        if selected == 3 {
                            Text("Future")
                                .padding(.bottom, 8)
                                .background(color)
                                .padding(.bottom, 3)
                                .background(Color.red)
                        } else {
                            Text("Future")
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .font(.system(size: 18, design: .rounded))
                .foregroundColor(.primary)
                .animation(.linear)
                .padding(.bottom, 1)
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    ItemCell(color: Color.orange)
                    ItemCell(color: Color.blue)
                    ItemCell(color: Color.green)
                    ItemCell(color: Color.yellow)
                    ItemCell(color: Color.black)
                    ItemCell(color: Color.gray)
                }
                .padding(.bottom, 20)
                
                .background(Color.gray.opacity(0.15))
            }
            .padding(.top, 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ItemCell: View {
    var color: Color
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(height: 230)
            VStack(alignment: .leading) {
                HStack {
                    Text("Small stuff adds up!")
                        .font(.headline)
                    Spacer()
                    Text("09-06-2018")
                        .font(.subheadline)
                }
                .padding(.bottom, 8)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                    Text("SETUP A GOAL")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(50)
                        .font(.system(size: 15))
                    Spacer()
                    Image(systemName: "heart")
                        .font(.title)
                }
            }
            .padding(20)
            .foregroundColor(.white)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white))
        .shadow(radius: 5)
        .frame(height: 230)
        .padding(.top)
        .padding(.horizontal)
        
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

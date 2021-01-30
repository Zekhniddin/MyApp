//
//  LogInScreen.swift
//  MyApp
//
//  Created by Зехниддин on 30/01/21.
//

import SwiftUI

struct LogInScreen: View {
    @EnvironmentObject var status: Status
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 143 / 255, green: 238 / 255, blue: 199 / 255), Color(red: 74 / 255, green: 123 / 255, blue: 240 / 255)]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 22) {
                Spacer()
                
                Text("My App")
                    .foregroundColor(.white)
                    .font(Font.system(size: 60, design: .rounded))
                    .fontWeight(.bold)
                    .shadow(radius: 10)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 35)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 3))
                    .offset(y: -40)
                   
                ZStack(alignment: .center) {
                    if username.isEmpty {
                        Text("USERNAME")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    TextField("", text: $username).modifier(FieldStyle())
                }
                .padding(.horizontal, 30)
                
                ZStack(alignment: .center) {
                    if password.isEmpty {
                        Text("PASSWORD")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    SecureField("", text: $password).modifier(FieldStyle())
                }
                .padding(.horizontal, 30)
                
                Button(action: {
                    UserDefaults.standard.setValue("data", forKey: "key")
                    status.listen()
                }) {
                    Text("LOG IN")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black.opacity(0.4), lineWidth: 0.2)
                        )
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Text("Don't have an account?")
                        .foregroundColor(Color.white.opacity(0.5))
                    Button(action: { }) {
                        Text("Sign up")
                            .foregroundColor(Color.white.opacity(0.8))
                    }
                }
                .font(.title3)
                .offset(y: -50)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.title3)
            .frame(height: 70)
            .accentColor(.black)
            .background(Color.white.opacity(0.2))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black.opacity(0.4), lineWidth: 0.2)
            )
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}

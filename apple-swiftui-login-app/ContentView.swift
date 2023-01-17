//
//  ContentView.swift
//  apple-swiftui-login-app
//
//  Created by Jeremy Chua on 31/12/22.
//

import SwiftUI

struct InputTextField: View {
    @Binding var stateBinding: String
    let label: String
    let placeholder: String
    let secure: Bool
    
    /*
    init(label: String, placeholtring){
        self.label = label
        self.placeholder = placeholder
        self.secure = false
    }
    
    init(label: String, placeholder:String, secure: Bool){
        self.label = label
        self.placeholder = placeholder
        self.secure = secure
    }*/
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.headline)
                .foregroundColor(.red)
            
            if (secure) {
                SecureField(placeholder, text: $stateBinding)
                    .textFieldStyle(.roundedBorder)
            }
            else{
                TextField(placeholder, text: $stateBinding)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
}


struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
   
    var body: some View {
        VStack(alignment: .center){
            Spacer() // Extends into white space
            HStack{
                Spacer()
                Image("UserIcon")
                //.resizable().clipShape(Circle())
                /*.frame(width: 200, height: 200)
                 .clipped()
                 .cornerRadius(30) //Interchange resizable*/
                    .resizable()
                    .padding()
                    .frame(width: 200, height: 200)
                    .aspectRatio (CGSize(width: 315, height: 502), contentMode: .fit)
                Spacer()
            }
            
            InputTextField(stateBinding: $username, label: "Username", placeholder: "Enter username", secure: false)
            InputTextField(stateBinding: $password, label: "Password", placeholder: "Enter password", secure: true)
            
            
            HStack(alignment: .center){
                Button(action: {
                    print("\(self.username) and \(self.password)")
                }){
                    Spacer()
                    HStack(alignment: .center){
                        Spacer()
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.mint)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                    .background(.black)
                    .cornerRadius(50)
                    .frame(width: 100)
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            
            Spacer() // Extends into white space
        }
        .padding(.horizontal)
        .background(Image("BackgroundWallpaper")
            .resizable()
            .scaledToFill()
            .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

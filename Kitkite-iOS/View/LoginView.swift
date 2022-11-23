//
//  LoginView.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI

struct LoginView: View {
    @State  var email: String = ""
    @State  var password: String = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @ObservedObject var viewModel = UserViewModel()
    var currentUser: User?
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
//                    .stroke(Color.white)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.55)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    
                    SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
                    
                    SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google").foregroundColor(Color("PrimaryColor")))
                        .padding(.vertical)
                    
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                        
                    
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat())
                    
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)){
                        Button("Login",action: {
                            viewModel.login(email: viewModel.email, password: viewModel.password,completed: {(user)in
                                if let _ = user {
                                    print("logged in")
                                }else {
                                    print("not logged in")
                                }
                            })
                            
                        })
                            
                        
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                    }
                                     
                }
            }.navigationBarHidden(true)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SocalLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
                .padding(.horizontal)
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.08))
        .cornerRadius(50.0)
        .shadow(color: Color.gray.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}

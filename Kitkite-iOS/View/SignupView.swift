//
//  SignupView.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI

struct SignupView: View {
    let gradient = Gradient(colors: [.blue, .mint])
    @State  var username: String = ""
    @State  var firstname: String = ""
    @State  var lastname: String = ""
    @State  var email: String = ""
    @State  var password: String = ""
    @State  var birthdate = Date()
    @State private var redirectLogin = false
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
//                Color("Background")
//                    .ignoresSafeArea()
//                Ellipse()
//                    .scale(1.24)
//                    .stroke(Color.white)
//                    .foregroundColor(.white.opacity(0.15))
//                Ellipse()
//                    .scale(1.1)
//                    .foregroundColor(.white)
                VStack{
                    
                    Text("Create an account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.654, brightness: 0.052))
                        .bold()
                        .padding()
                    
                    
                    TextField("Username", text: $viewModel.username)
                        .padding()
                        .font(.title3)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disableAutocorrection(true)
                    
                    TextField("First Name", text: $viewModel.firstname)
                        .padding()
                        .font(.title3)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disableAutocorrection(true)

                    
                    TextField("Last Name", text: $viewModel.lastname)
                        .padding()
                        .font(.title3)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disableAutocorrection(true)

                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .font(.title3)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disableAutocorrection(true)

                    
                    SecureField("Type your password", text: $viewModel.password)
                        .padding()
                        .font(.title3)
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disableAutocorrection(true)

                    
//                    SecureField("Confirm your password", text: $repassword)
//                        .padding()
//                        .font(.title3)
//                        .foregroundColor(.black)
//                        .frame(width: 300, height: 50)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(10)
                    
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        

                    //                        .datePickerStyle(WheelPickerStyle())
                    
//                    Picker(selection: $viewModel.gender, label: Text("Gender:")) {
//                        Text("Male").tag("Male")
//                        Text("Female").tag("Female")
//                    }
//                    .padding()
//                    .frame(width: 300, height: 50)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(10)
                    
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $redirectLogin ){
                        Button("Register", action: {
                            viewModel.signup(user: User(username: viewModel.username,email: viewModel.email, password: viewModel.password, firstname: viewModel.firstname, lastname: viewModel.lastname, birthdate: viewModel.birthdate))
                            redirectLogin=true
                        })
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                    }
                }//VStack
                
                
                
            }//Zstack
        }//navigationView
    }//view
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SignupView()
        }
    }
    
    
}



//    VStack {
//        TextField("Name", text: $firstname)
//            .font(.title3)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//            .cornerRadius(30.0)
//            .shadow(color: Color.black.opacity(0.08), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
//        //                        .padding(.vertical)
//
//        TextField("Last name", text: $lastname)
//            .font(.title3)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//            .cornerRadius(30.0)
//            .shadow(color: Color.black.opacity(0.08), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
//
//        TextField("Email adress", text: $email)
//            .font(.title3)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//            .cornerRadius(30.0)
//            .shadow(color: Color.black.opacity(0.08), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
//
//
//
//        SecureField("Write your password", text: $password)
//            .font(.title3)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//            .cornerRadius(30.0)
//            .shadow(color: Color.black.opacity(0.08), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
//
//        SecureField("Confirm your password", text: $repassword)
//            .font(.title3)
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
//            .cornerRadius(30.0)
//            .shadow(color: Color.black.opacity(0.08), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
//
//        DatePicker("Birthday",selection: $birthdate, displayedComponents: .date)
//
//        Spacer()
//
//        Button {} label: {
//            Text("Register")
//        }.buttonStyle(.borderedProminent)
//
//    }
//


//
//  ProfileHeader.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI

struct UpdateProfileView: View {
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var birthdate = Date()
    @State private var bio = ""
    
    let gradient = Gradient(colors: [.blue, .mint])
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Spacer()
                    ScrollView{

                        VStack {
                            HStack{
                                Image("aziz")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .clipped()
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .padding(.top, 44)
                                
                                
                            }
                            Text("Aziz Kefi").font(.system(size: 20)).bold().foregroundColor(.white)
                                .padding(.top, 12)
                            
                            Text("@azzouzti").font(.system(size: 18)).foregroundColor(.white)
                                .padding(.top, 1)
                            
                            NavigationView {
                                List {
                                    Section(header: Text("Personal Information")){
                                        TextField("First Name", text: $firstname)
                                            .padding(0.5)
                                        TextField("Last Name", text: $lastname)
                                            .padding(0.5)
                                        TextField("Bio", text: $bio, axis: .vertical)
                                            .padding(0.5)
                                        SecureField("Password", text: $lastname)
                                            .padding(0.5)
                                        DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                                            .padding(0.5)
                                        
                                    }
                                    
                                }
                                .navigationTitle("Account")
                                .toolbar {
                                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                                        Button("Save"){
                                            
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    Spacer()
                }
                Spacer()
            }

            .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
//            .edgesIgnoringSafeArea(.all)
            
        }

        
    }
    
}


struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView()
    }
}

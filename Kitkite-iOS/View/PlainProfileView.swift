//
//  ProfileView.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI

struct PlainProfileView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var birthdate = Date()
    @State private var bio = ""
    
    let gradient = Gradient(colors: [.blue, .mint])
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
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
                                Text("First Name")
                                    .padding(0.5)
                                Text("Last Name")
                                    .padding(0.5)
                                Text("Bio")
                                    .padding(0.5)
                                Text("Birthday")
                                    .padding(0.5)
                                
                            }
                            
                        }
                        .navigationTitle("Account")
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button("Edit"){
                                    
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
        .edgesIgnoringSafeArea(.all)
        
    }
    
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PlainProfileView()
    }
}

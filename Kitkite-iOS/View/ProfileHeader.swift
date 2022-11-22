//
//  ProfileHeader.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import SwiftUI

struct ProfileHeader: View {
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
                    .padding(.top, 4)
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        .toolbar {
            EditButton()
                .foregroundColor(.white)
        }
    }
}


struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}

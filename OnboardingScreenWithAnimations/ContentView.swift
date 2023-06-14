//
//  ContentView.swift
//  OnboardingScreenWithAnimations
//
//  Created by Göktug Yeşil on 14.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        if currentPage > totalPages{
            Home()
        }else{
            OnboardingScreen()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Home Screen
struct Home: View {
    var body: some View{
        VStack {
            Text("Anasayfaya Hoşgeldiniz!")
                .font(.title)
                .fontWeight(.heavy)
            
            
            Text("Goktug Yesil")
                .font(.body)
                .fontWeight(.medium)
        }
    }
}

var totalPages = 3

//OnBoarding Screens

struct OnboardingScreen: View{
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        ZStack{
            if currentPage == 1 {
                ScreenView(image: "Image1", title: "Onboarding APP", details: "")
            }
            if currentPage == 2 {
                ScreenView(image: "Image2", title: "Onboarding APP", details: "")
            }
            if currentPage == 3 {
                ScreenView(image: "Image3", title: "Onboarding APP", details: "")
            }
            
        }
    }
}

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var details: String
    
    var body: some View {
        VStack{
            HStack{
                
                if currentPage == 1 {
                    Text("Hello World!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }else{
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                
                
                Spacer()
                
                Button(action: {
                    currentPage = 4
                }, label: {
                    Text("Geç")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }.padding()
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength: 80)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom,5)
                .foregroundColor(Color("mainColor"))
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean consequat magna ac ante ullamcorper, vel placerat est finibus. Vivamus nec dui pharetra, congue lorem id.")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            HStack{
                if currentPage == 1{
                    Color("mainColor").frame(height: 8 / UIScreen.main.scale)
                    
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                }
                else if currentPage == 2 {
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    
                    Color("mainColor").frame(height: 8 / UIScreen.main.scale)
                    
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                }
                else if currentPage == 3 {
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    
                    Color("mainColor").frame(height: 8 / UIScreen.main.scale)
                }
                
            }.padding(.horizontal, 35)
            
            Button(action: {
                if currentPage <= totalPages {
                    currentPage += 1
                }else{
                    
                    currentPage = 1
                    
                }
            }, label: {
                
                if currentPage == 3 {
                    HStack {
                        Text("Giriş Yap")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("mainColor"))
                            .cornerRadius(40)
                            .padding(.horizontal,8)
                    
                    
                        Text("Kayıt Ol")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("mainColor"))
                            .cornerRadius(40)
                            .padding(.horizontal,8)
                    }
                }else{
                    
                    Text("İleri")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("mainColor"))
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                }
            })
        }
    }
}

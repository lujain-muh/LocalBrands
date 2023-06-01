//
//  Onboarding.swift
//  LocalBrands
//
//  Created by Shifa Alfaisal on 11/11/1444 AH.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var currentTab = 0
    @State var isLinkActive = false
    
    @State var toContentView = false
    
    var body: some View {
        //NavigationView {
//        ZStack {
//            Image("1")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//                .foregroundColor(.black); Rectangle()
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.0)
            TabView(selection: $currentTab,
                    content:  {
                ZStack {
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.black); Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.0)

                    VStack(){
                        
                        Text("منصة تجمع أبرز الكفاءات المبدعة في التصميم والفن بالمملكة")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 350)
                            .bold()
                            .padding(.top, 500.0)
                            .environment(\.locale, Locale(identifier: "ar"))
                            .environment(\.layoutDirection, .rightToLeft)
                    }
                }.tag(0)
                ZStack {
                    
                    Image("2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.black); Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.0)
                
                    VStack(){
                        Text("نعرض لكم أفضل المنتجات المصممة بأيادي عربية")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 350)
                            .bold()
                            .padding(.top, 500.0)
                            .environment(\.locale, Locale(identifier: "ar"))
                            .environment(\.layoutDirection, .rightToLeft)
                    }
                }.tag(1)
                ZStack {
                    
                    Image("3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.black); Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.0)
                
                    VStack(){
                        Text("نعرض لكم أفضل المنتجات المصممة بأيادي عربية")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 350)
                            .bold()
                            .padding(.top, 500.0)
                            .environment(\.locale, Locale(identifier: "ar"))
                            .environment(\.layoutDirection, .rightToLeft)
                    }
                }.tag(2)
            }).tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .ignoresSafeArea()

            //.navigationBarHidden(true)
            
            
            
            //}//nav
            //        .fullScreenCover(isPresented: $toContentView) {
            //            TabBar()
            //        }
            //        .navigationBarHidden(true)
        }

    }


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

//
//  SplashScreenView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/24/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if let appColor = UIColor(named: "AppColor") {
            ZStack {
                Color(appColor)
                    .ignoresSafeArea()
                VStack {
                    if isActive {
                        ThemePageView()
                    } else {
                        VStack {
                            Image("TradeMaster")
                                .font(.system(size: 80))
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}


#Preview {
    SplashScreenView()
}

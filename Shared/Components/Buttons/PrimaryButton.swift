//
//  PrimaryButton.swift
//  CombineAndData (iOS)
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct PrimaryButton: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @AppStorage("isLiteMode") var isLiteMode: Bool = false
    var text: String = "Contact support"
    
    var body: some View {
        if colorScheme == .light {
            lightModeButton
        } else {
            darkModeButton
        }
        
        
    }
    
    var lightModeButton: some View {
        VStack {
            Text(text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.6350396276, green: 0.5573728681, blue: 0.9254394174, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .foregroundColor(.white)
    }
    
    var darkModeButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(height: 50)
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.3843137255, green: 0.5176470588, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.4470588235, blue: 0.7137254902, alpha: 1)), Color(#colorLiteral(red: 0.8509803922, green: 0.6862745098, blue: 0.8509803922, alpha: 1)), Color(#colorLiteral(red: 0.5921568627, green: 0.8823529412, blue: 0.831372549, alpha: 1)), Color(#colorLiteral(red: 0.3843137255, green: 0.5176470588, blue: 1, alpha: 1))])
                .if(!isLiteMode, transform: { view in
                    view.blur(radius: 8)
                })
                
            
            Text(text)
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color(#colorLiteral(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549, alpha: 1)).opacity(0.9))
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
        }
        .frame(height: 50)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}

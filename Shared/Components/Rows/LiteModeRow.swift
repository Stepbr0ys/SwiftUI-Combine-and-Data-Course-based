//
//  LiteModeRow.swift
//  CombineAndData (iOS)
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct LiteModeRow: View {
   
    @AppStorage("isLiteMode") var isLiteMode: Bool = false
    
    var body: some View {
        Toggle(isOn: $isLiteMode) {
            HStack (spacing: 12){
                GradientIcon(icon: "speedometer")
                
                VStack (alignment: .leading) {
                    Text("Lite Mode")
                        .font(.subheadline.weight(.semibold))
                    
                    Text("Better performance. Recommended for iPhone X and older")
                        .font(.caption2)
                        .opacity(0.7)
                }
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.4212473631, green: 0.4374457002, blue: 0.8710209727, alpha: 1))))
    }
}

struct LiteModeRow_Previews: PreviewProvider {
    static var previews: some View {
        LiteModeRow()
    }
}

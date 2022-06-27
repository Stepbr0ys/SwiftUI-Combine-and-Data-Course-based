//
//  MenuRow.swift
//  CombineAndData
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct MenuRow: View {
    var title = "FAQ / Contact"
    var leftIcon: String = "questionmark"
    var rightIcon: String = "chevron.right"
    
    var body: some View {
        HStack (spacing: 12){
            GradientIcon(icon: leftIcon)
            
            Text(title)
                .font(.subheadline.weight(.semibold))
            
            Image(systemName: rightIcon)
                .font(.system(size: 15,weight: .semibold))
                .opacity(0.3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}

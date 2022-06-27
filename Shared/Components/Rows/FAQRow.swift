//
//  FAQRow.swift
//  CombineAndData
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct FAQRow: View {
    var faq : FAQ
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(faq.question)
                .font(.title3.weight(.bold))
            
            Text(faq.answer)
                .font(.subheadline)
                .opacity(0.7)
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct FAQRow_Previews: PreviewProvider {
    static var previews: some View {
        FAQRow(faq: faqData[0])
    }
}

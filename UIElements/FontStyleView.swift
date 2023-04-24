//
//  ContentView.swift
//  UIElements
//
//  Created by JungHoon Noh on 2023/04/20.
//

import SwiftUI

struct TextSample: View {
    var text: String
    var font: Font
    var title: String
    var size: CGFloat
    var weight: String
    
    init(_ text: String, font: Font, title: String, size: CGFloat, weight: String) {
        self.text = text
        self.font = font
        self.title = title
        self.size = size
        self.weight = weight
    }
    
    var attrTitle: AttributedString {
        var result = AttributedString(title)
        result.foregroundColor = .label
        result.font = .system(size: 14, weight: .semibold)
        return result
    }
        
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                //                .border(.blue, width: 1)
                Text("(size: \(highlightedText("\(size)", size: 12)), weight: \(highlightedText("\(weight)", size: 12)))")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .background(Color(uiColor: .secondarySystemBackground))
            
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(font)
                .padding(.horizontal, 4)
        }
    }
    
    func highlightedText(_ text: String, size: CGFloat = 14) -> AttributedString {
        var result = AttributedString(text)
        result.foregroundColor = .label
        result.font = .system(size: size, weight: .semibold)
        return result
    }

}

struct FontStyleView: View {
//    let text = "Hello, World!"
//    let text = "The quick brown fox jumps over the lazy dog"
    let text = "SwiftUI Font Style"
    var body: some View {
        VStack {
            Group {
              
                VStack(spacing: 20) {
                    TextSample(text, font: .largeTitle, title: ".largeTitle", size: 34, weight: ".regular")
                    TextSample(text, font: .title, title: ".title", size: 28, weight: ".regular")
                    TextSample(text, font: .title2, title: ".title2", size: 22, weight: ".regular")
                    TextSample(text, font: .title3, title: ".title3", size: 20, weight: ".regular")
                }
            }
            Spacer()
                .frame(height: 20)
            Group {

                VStack(spacing: 20) {
                    TextSample(text, font: .headline, title: ".headline", size: 17, weight: ".semibold")
                    TextSample(text, font: .subheadline, title: ".subheadline", size: 15, weight: ".regular")
                }
            }
            Spacer()
                .frame(height: 20)
            Group {

                VStack(spacing: 20) {
                    TextSample(text, font: .body, title: ".body", size: 17, weight: ".regular")
                    TextSample(text, font: .callout, title: ".callout", size: 16, weight: ".regular")
                    TextSample(text, font: .footnote, title: ".footnote", size: 13, weight: ".regular")
                    TextSample(text, font: .caption, title: ".caption", size: 12, weight: ".regular")
                    TextSample(text, font: .caption2, title: ".caption2", size: 11, weight: ".regular")
                }
            }
        }
        .frame(maxWidth: 650)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FontStyleView()
    }
}

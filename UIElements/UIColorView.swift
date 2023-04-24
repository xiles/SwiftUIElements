//
//  UIColorView.swift
//  UIElements
//
//  Created by JungHoon Noh on 2023/04/20.
//

import SwiftUI

struct ColorLabelView: View {
    var uiColor: UIColor
    @State var r: CGFloat
    @State var g: CGFloat
    @State var b: CGFloat
    @State var alpha: CGFloat
    
    init(uiColor: UIColor) {
        self.uiColor = uiColor
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        _r = State(initialValue: r)
        _g = State(initialValue: g)
        _b = State(initialValue: b)
        _alpha = State(initialValue: a)
    }
    
    var body: some View {
        HStack(spacing: 1) {
            Text("(\(Int(r * 255))")
            Text(", ")
            Text("\(Int(g * 255))")
            Text(", ")
            Text("\(Int(b * 255))")
            Text(", ")
            Text("\(alpha, specifier: "%.2f"))")
        }
        .font(.system(size: 11))
        .foregroundColor(.secondary)
    }
}

struct ColorView: View {
    var uiColor: UIColor
    var title: String
    
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                .fill(Color(uiColor: uiColor))
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                        .stroke(Color(.secondarySystemBackground))
                }
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                ColorLabelView(uiColor: uiColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}

struct LabelColorView: View {
    var uiColor: UIColor
    var title: String
    var backgroundColor: Color?
    
    var body: some View {
        HStack {
            Text("Text Color")
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .foregroundColor(Color(uiColor: uiColor))
                .background(backgroundColor ?? .clear, in: RoundedRectangle(cornerRadius: 2))
                .frame(width: 120)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                ColorLabelView(uiColor: uiColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, minHeight: 20)
    }
}

struct LineColorView: View {
    var uiColor: UIColor
    var title: String
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(Color(uiColor: uiColor))
                .frame(maxWidth: 120, maxHeight: 1)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                ColorLabelView(uiColor: uiColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, minHeight: 20)
    }
}

struct UIColorView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var isDarkMode: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            Toggle("Dark Mode", isOn: $isDarkMode)
            
            HStack(alignment: .top) {
                VStack {
                    ColorView(uiColor: .systemBackground, title: ".systemBackground")
                    ColorView(uiColor: .secondarySystemBackground, title: ".secondarySystemBackground")
                    ColorView(uiColor: .tertiarySystemBackground, title: ".tertiarySystemBackground")
                    ColorView(uiColor: .systemGroupedBackground, title: ".systemGroupedBackground")
                    ColorView(uiColor: .secondarySystemGroupedBackground, title: ".secondarySystemGroupedBackground")
                    ColorView(uiColor: .tertiarySystemGroupedBackground, title: ".tertiarySystemGroupedBackground")
                }
                
                VStack {
                    ColorView(uiColor: .systemFill, title: ".systemFill")
                    ColorView(uiColor: .secondarySystemFill, title: ".secondarySystemFill")
                    ColorView(uiColor: .tertiarySystemFill, title: ".tertiarySystemFill")
                    ColorView(uiColor: .quaternarySystemFill, title: ".quaternarySystemFill")
                }
                
                VStack {
                    ColorView(uiColor: .systemGray, title: ".systemGray")
                    ColorView(uiColor: .systemGray2, title: ".systemGray2")
                    ColorView(uiColor: .systemGray3, title: ".systemGray3")
                    ColorView(uiColor: .systemGray4, title: ".systemGray4")
                    ColorView(uiColor: .systemGray5, title: ".systemGray5")
                    ColorView(uiColor: .systemGray6, title: ".systemGray6")

                }
            }

            HStack(alignment: .top) {
                VStack {
                    LabelColorView(uiColor: .label, title: ".label")
                    LabelColorView(uiColor: .secondaryLabel, title: ".secondaryLabel")
                    LabelColorView(uiColor: .tertiaryLabel, title: ".tertiaryLabel")
                    LabelColorView(uiColor: .quaternaryLabel, title: ".quaternaryLabel")
                    LabelColorView(uiColor: .link, title: ".link")
                    LabelColorView(uiColor: .placeholderText, title: ".placeholderText")
    
                    if colorScheme == .dark {
                        LabelColorView(uiColor: .lightText, title: ".lightText")
                        LabelColorView(uiColor: .darkText, title: ".darkText", backgroundColor: Color(uiColor: .systemGray))
                    } else {
                        LabelColorView(uiColor: .lightText, title: ".lightText", backgroundColor: Color(uiColor: .systemGray))
                        LabelColorView(uiColor: .darkText, title: ".darkText")
                    }
                }
                
                VStack {
                    LineColorView(uiColor: .separator, title: ".separator")
                    LineColorView(uiColor: .opaqueSeparator, title: ".opaqueSeparator")
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .frame(width: 830)
    }
}

struct UIColorView_Previews: PreviewProvider {
    static var previews: some View {
        UIColorView()
    }
}


/*
 
 @available(iOS 7.0, *)
 open class var systemRed: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemGreen: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemBlue: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemOrange: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemYellow: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemPink: UIColor { get }

 @available(iOS 9.0, *)
 open class var systemPurple: UIColor { get }

 @available(iOS 7.0, *)
 open class var systemTeal: UIColor { get }

 @available(iOS 13.0, *)
 open class var systemIndigo: UIColor { get }

 @available(iOS 13.0, *)
 open class var systemBrown: UIColor { get }

 @available(iOS 15.0, *)
 open class var systemMint: UIColor { get }

 @available(iOS 15.0, *)
 open class var systemCyan: UIColor { get }
 */

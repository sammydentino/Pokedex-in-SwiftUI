//
//  Extensions.swift
//  Pokedex
//
//  Created by Sammy Dentino on 11/15/20.
//  Copyright © 2020 Sammy Dentino. All rights reserved.
//

import SwiftUI

class AnyGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        //To prevent keyboard hide and show when switching from one textfield to another
        if let textField = touches.first?.view, textField is UITextField {
            state = .failed
        } else {
            state = .began
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
}


extension View {
    //fixes capitalization bug in iOS 14
    @ViewBuilder func fixCase() -> some View {
        if #available(iOS 14.0, *) {
            self.textCase(.none)
        } else {
            self
        }
    }
    
    //fixes the different list styles for 13 & 14
    @ViewBuilder func fixList() -> some View {
        if #available(iOS 14.0, *) {
            self.listStyle(InsetGroupedListStyle())
        } else {
            self.listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
        }
    }
    
    //text style modifiers
    @ViewBuilder func tab(i: CGFloat) -> some View {
        self.font(.system(size: i, weight: .medium, design: .rounded))
    }
    @ViewBuilder func title() -> some View {
        self.font(.system(size: 28, weight: .bold, design: .rounded)).animation(.default).fixCase()
    }
    @ViewBuilder func subhead() -> some View {
        self.font(.system(size: 15, weight: .semibold, design: .rounded)).animation(.default).fixCase()
    }
    @ViewBuilder func head() -> some View {
        self.font(.system(size: 17, weight: .light, design: .rounded)).animation(.default).fixCase()
    }
    @ViewBuilder func caption() -> some View {
        self.font(.system(size: 12, weight: .bold, design: .rounded)).animation(.default).fixCase()
    }
    @ViewBuilder func textColor(i: Color) -> some View {
        self.foregroundColor(i)
    }
    @ViewBuilder func bgColor(i: Color) -> some View {
        self.background(i)
    }
    
    //padding shorthand functions
    @ViewBuilder func pad(i: CGFloat) -> some View {
        self.padding(i)
    }
    @ViewBuilder func hPad(i: CGFloat) -> some View {
        self.padding(.horizontal, i)
    }
    @ViewBuilder func vPad(i: CGFloat) -> some View {
        self.padding(.vertical, i)
    }
    @ViewBuilder func aPad(i: CGFloat) -> some View {
        self.padding(.all, i)
    }
    @ViewBuilder func tPad(i: CGFloat) -> some View {
        self.padding(.top, i)
    }
    @ViewBuilder func bPad(i: CGFloat) -> some View {
        self.padding(.bottom, i)
    }
    @ViewBuilder func lPad(i: CGFloat) -> some View {
        self.padding(.leading, i)
    }
    @ViewBuilder func rPad(i: CGFloat) -> some View {
        self.padding(.trailing, i)
    }
    
    //navigation view builders
    @ViewBuilder func makeNav() -> some View {
        NavigationView {
            self
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarColor(UIColor.myControlBackground)
    }
    @ViewBuilder func makeHomeNav() -> some View {
        NavigationView {
            self
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarColor(UIColor.myControlBackground).bPad(i: -7.5)
    }
    @ViewBuilder func makeRadarNav() -> some View {
        NavigationView {
            self.edgesIgnoringSafeArea(.bottom)
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarColor(UIColor.myControlBackground)
    }
    
    //list section builders
    @ViewBuilder func makeSection(str: String) -> some View {
        if #available(iOS 14.0, *) {
            Section(header: Text("   \(str)").subhead()) {
                self
            }
        } else {
            Section(header: Text("\(str)").subhead()) {
                self
            }
        }
    }
    @ViewBuilder func makeNewLineSection(str: String) -> some View {
        if #available(iOS 14.0, *) {
            Section(header: Text("\n   \(str)").subhead()) {
                self
            }
        } else {
            Section(header: Text("\n\(str)").subhead()) {
                self
            }
        }
    }
    @ViewBuilder func makeDarkSection(str: String) -> some View {
        Section(header: Text("\(str)").subhead().foregroundColor(.primary)) {
            self
        }
    }
    @ViewBuilder func makeEmptySection() -> some View {
        Section(header: Text(" ")) {
            self
        }
    }
    
    //navigation bar title setters
    @ViewBuilder func sTitle(str: String) -> some View {
        self.navigationBarTitle("\(str)", displayMode: .inline)
    }
    @ViewBuilder func lTitle(str: String) -> some View {
        self.navigationBarTitle("\(str)", displayMode: .large)
    }
    
    //navigation stack style setter
    @ViewBuilder func navStack() -> some View {
        self.navigationViewStyle(StackNavigationViewStyle())
    }
    
    @ViewBuilder func navButton(actionin: (() -> Void)?, str: String) -> some View {
        self.navigationBarItems(leading:
            Button(action: {
                    actionin?()
            }) {
                Text(str).subhead().textColor(i: .secondary)
            })
    }
    
    //set nav bar color
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

//required struct for the navigationBarColor View extension func
struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor.myControlBackground
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.myControlText]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.myControlText]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .systemTeal
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        var counter = 0

        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
            counter += 1
            if counter % 4 == 0 {
                binaryString.insert(contentsOf: " ", at: binaryString.startIndex)
            }
        }
        return binaryString
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UIColor {
    static let myControlBackground: UIColor = dynamicColor(light: UIColor.white, dark: UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1.0))
    static let myTabBackground: UIColor = dynamicColor(light: UIColor.white, dark: .black)
    static let myControlText: UIColor = dynamicColor(light: UIColor.black, dark: UIColor.white)
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

extension Image {
    func themeImageModifier() -> some View {
        self.resizable().clipped().frame(width: 40, height: 40)
    }
    func themeImageModifierOWM() -> some View {
        self.resizable().clipped().frame(width: 50, height: 50).padding(-5)
    }
    func themeImageModifierLarge() -> some View {
        self.resizable().clipped().frame(width: 75, height: 75)
    }
    func themeImageModifierOWMLarge() -> some View {
        self.resizable().clipped().frame(width: 100, height: 100)
    }
    func dayThemeImageModifier() -> some View {
        self.resizable().clipped().frame(width: 45, height: 45)
    }
    func dayThemeImageModifierOWM() -> some View {
        self.resizable().clipped().frame(width: 55, height: 55).padding(-5)
    }
    func sunriseImageModifier() -> some View {
        self.resizable().clipped().frame(width: 25, height: 25)
    }
    func sunriseImageModifierOWM() -> some View {
        self.resizable().clipped().frame(width: 35, height: 35).padding(-5)
    }
}

extension Color {
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)
    static let placeholderText = Color(UIColor.placeholderText)

    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)

    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)

    static let systemFill = Color(UIColor.systemFill)
    static let secondarySystemFill = Color(UIColor.secondarySystemFill)
    static let tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    static let quaternarySystemFill = Color(UIColor.quaternarySystemFill)

    static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)

    static let systemGray = Color(UIColor.systemGray)
    static let systemGray2 = Color(UIColor.systemGray2)
    static let systemGray3 = Color(UIColor.systemGray3)
    static let systemGray4 = Color(UIColor.systemGray4)
    static let systemGray5 = Color(UIColor.systemGray5)
    static let systemGray6 = Color(UIColor.systemGray6)

    static let separator = Color(UIColor.separator)
    static let opaqueSeparator = Color(UIColor.opaqueSeparator)
    static let link = Color(UIColor.link)

    static var systemRed: Color { return Color(UIColor.systemRed) }
    static var systemBlue: Color { return Color(UIColor.systemBlue) }
    static var systemPink: Color { return Color(UIColor.systemPink) }
    static var systemTeal: Color { return Color(UIColor.systemTeal) }
    static var systemGreen: Color { return Color(UIColor.systemGreen) }
    static var systemIndigo: Color { return Color(UIColor.systemIndigo) }
    static var systemOrange: Color { return Color(UIColor.systemOrange) }
    static var systemPurple: Color { return Color(UIColor.systemPurple) }
    static var systemYellow: Color { return Color(UIColor.systemYellow) }
}

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                if $0.count > 0 {
                    return ($0 + " " + String($1))
                }
            }
            return $0 + String($1)
        }
    }
}

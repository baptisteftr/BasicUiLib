// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 15.0, *)
public extension View {
    func roundedCard(color: Color?, radius: Double?) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: radius != nil ? radius! : 25.0)
                    .foregroundStyle(color != nil ? color! : Color(uiColor: .secondarySystemBackground))
            )
    }
}

@available(iOS 15.0, *)
public var RandomColor: Color {
    let red = Double.random(in: 0...1)
    let green = Double.random(in: 0...1)
    let blue = Double.random(in: 0...1)
    return Color(red: red, green: green, blue: blue)
}

// ----------------------------------------------------------------------------- \\

@available(iOS 15.0, *)
public struct DismissButton: View {
    @Environment(\.dismiss) private var dismiss

    let text: String

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        Button(text) {
            dismiss()
        }
    }
}

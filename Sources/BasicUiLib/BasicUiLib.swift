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

public struct CircleProgressLibView: View {
    public var percent: Double
    public var size: Double
    public var mainColor: Color?
    public var backColor: Color?

    public init(percent: Double, size: Double, mainColor: Color? = nil, backColor: Color? = nil) {
        self.percent = percent
        self.size = size
        self.mainColor = mainColor
        self.backColor = backColor
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(backColor != nil ? backColor! : Color(UIColor.tertiarySystemBackground), lineWidth: 4)
                .frame(width: size, height: size)

            Circle()
                .trim(from: 0, to: percent)
                .stroke(mainColor != nil ? mainColor! : Color(UIColor.systemBlue), lineWidth: 4)
                .frame(width: size, height: size)
                .rotationEffect(.degrees(-180))
        }
        .frame(width: size + 10, height: size + 10, alignment: .center)
    }
}






import SwiftUI

enum CalmDesign {
    enum ColorPalette {
        static let softCreamBackground = Color(red: 0.98, green: 0.96, blue: 0.90)
        static let gentleBlue = Color(red: 0.46, green: 0.63, blue: 0.74)
        static let gentleGreen = Color(red: 0.47, green: 0.63, blue: 0.52)
        static let softPeach = Color(red: 0.86, green: 0.55, blue: 0.45)
        static let warmText = Color(red: 0.25, green: 0.23, blue: 0.20)
        static let mutedText = Color(red: 0.50, green: 0.47, blue: 0.42)
        static let cardBackground = Color(red: 1.00, green: 0.99, blue: 0.96)
    }

    enum Layout {
        static let screenMaxWidth: CGFloat = 620
        static let controlMaxWidth: CGFloat = 500
        static let cornerRadius: CGFloat = 28
    }
}

struct SoftBackground: View {
    var body: some View {
        CalmDesign.ColorPalette.softCreamBackground
            .ignoresSafeArea()
    }
}

struct PrimaryNavigationButton: View {
    let title: String
    let systemImage: String
    let color: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: systemImage)
                .font(.title2.weight(.semibold))
                .frame(width: 34)

            Text(title)
                .font(.title2.weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: CalmDesign.Layout.controlMaxWidth)
        .modifier(ToddlerButtonSurface(color: color, minHeight: 76, isPressed: false, isEnabled: true))
    }
}

struct LearningPanel<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 24) {
            content
        }
        .padding(28)
        .frame(maxWidth: CalmDesign.Layout.screenMaxWidth)
        .background(CalmDesign.ColorPalette.cardBackground, in: RoundedRectangle(cornerRadius: CalmDesign.Layout.cornerRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: CalmDesign.Layout.cornerRadius, style: .continuous)
                .stroke(.white.opacity(0.7), lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.05), radius: 18, x: 0, y: 10)
    }
}

struct LearningCard<Content: View>: View {
    let tint: Color
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 18) {
            content
        }
        .padding(28)
        .frame(maxWidth: CalmDesign.Layout.screenMaxWidth)
        .background(CalmDesign.ColorPalette.cardBackground, in: RoundedRectangle(cornerRadius: 32, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .stroke(tint.opacity(0.22), lineWidth: 3)
        )
        .shadow(color: tint.opacity(0.14), radius: 18, x: 0, y: 10)
    }
}

struct ProgressPill: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .font(.headline.weight(.semibold))
            .foregroundStyle(CalmDesign.ColorPalette.warmText)
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(color.opacity(0.16), in: Capsule())
    }
}

struct PreviousNextControls: View {
    let canGoPrevious: Bool
    let canGoNext: Bool
    let previous: () -> Void
    let next: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            Button(action: previous) {
                Label("Previous", systemImage: "chevron.left")
            }
            .buttonStyle(LargeToddlerButtonStyle(color: CalmDesign.ColorPalette.gentleBlue, minHeight: 62))
            .disabled(!canGoPrevious)

            Button(action: next) {
                Label("Next", systemImage: "chevron.right")
            }
            .labelStyle(TrailingIconLabelStyle())
            .buttonStyle(LargeToddlerButtonStyle(color: CalmDesign.ColorPalette.gentleGreen, minHeight: 62))
            .disabled(!canGoNext)
        }
        .frame(maxWidth: CalmDesign.Layout.controlMaxWidth)
    }
}

struct LargeToddlerButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    let color: Color
    var minHeight: CGFloat = 76

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ToddlerButtonSurface(color: color, minHeight: minHeight, isPressed: configuration.isPressed, isEnabled: isEnabled))
    }
}

private struct ToddlerButtonSurface: ViewModifier {
    let color: Color
    let minHeight: CGFloat
    let isPressed: Bool
    let isEnabled: Bool

    func body(content: Content) -> some View {
        content
            .font(.title3.weight(.semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 22)
            .frame(maxWidth: .infinity, minHeight: minHeight)
            .background(color.opacity(isPressed ? 0.78 : 1.0), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .contentShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: color.opacity(isEnabled ? 0.18 : 0), radius: 12, x: 0, y: 8)
            .opacity(isEnabled ? 1.0 : 0.45)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: isPressed)
    }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            configuration.title
            configuration.icon
        }
    }
}

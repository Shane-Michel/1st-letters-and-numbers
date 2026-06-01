import SwiftUI

enum SoftColors {
    static let background = Color(red: 0.98, green: 0.96, blue: 0.91)
    static let panel = Color(red: 1.0, green: 0.99, blue: 0.96)
    static let leaf = Color(red: 0.47, green: 0.62, blue: 0.52)
    static let sky = Color(red: 0.47, green: 0.65, blue: 0.76)
    static let peach = Color(red: 0.85, green: 0.53, blue: 0.43)
    static let ink = Color(red: 0.22, green: 0.25, blue: 0.24)
    static let mutedInk = Color(red: 0.44, green: 0.47, blue: 0.45)
}

struct SoftBackground: View {
    var body: some View {
        SoftColors.background
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
        .foregroundStyle(.white)
        .padding(.horizontal, 24)
        .frame(maxWidth: 420, minHeight: 76)
        .background(color, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
        .contentShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: color.opacity(0.18), radius: 12, x: 0, y: 8)
    }
}

struct LearningPanel<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 24) {
            content
        }
        .padding(24)
        .frame(maxWidth: 560)
        .background(SoftColors.panel, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(.white.opacity(0.7), lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.05), radius: 18, x: 0, y: 10)
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
            .buttonStyle(SoftControlButtonStyle(color: SoftColors.sky))
            .disabled(!canGoPrevious)

            Button(action: next) {
                Label("Next", systemImage: "chevron.right")
            }
            .labelStyle(TrailingIconLabelStyle())
            .buttonStyle(SoftControlButtonStyle(color: SoftColors.leaf))
            .disabled(!canGoNext)
        }
        .frame(maxWidth: 520)
    }
}

struct SoftControlButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, minHeight: 58)
            .background(color.opacity(configuration.isPressed ? 0.78 : 1.0), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
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

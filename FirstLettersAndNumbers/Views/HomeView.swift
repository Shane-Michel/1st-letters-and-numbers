import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                SoftBackground()

                VStack(spacing: 34) {
                    Spacer(minLength: 28)

                    VStack(spacing: 14) {
                        Text("First Letters and Numbers")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(CalmDesign.ColorPalette.warmText)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("A calm first learning app")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(CalmDesign.ColorPalette.mutedText)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: CalmDesign.Layout.screenMaxWidth)

                    VStack(spacing: 18) {
                        NavigationLink {
                            LettersView()
                        } label: {
                            PrimaryNavigationButton(title: "Letters", systemImage: "textformat.abc", color: CalmDesign.ColorPalette.gentleGreen)
                        }

                        NavigationLink {
                            NumbersView()
                        } label: {
                            PrimaryNavigationButton(title: "Numbers", systemImage: "number", color: CalmDesign.ColorPalette.gentleBlue)
                        }

                        NavigationLink {
                            ParentGateView()
                        } label: {
                            PrimaryNavigationButton(title: "Parents", systemImage: "lock.shield", color: CalmDesign.ColorPalette.softPeach)
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: CalmDesign.Layout.controlMaxWidth)

                    Spacer(minLength: 28)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}

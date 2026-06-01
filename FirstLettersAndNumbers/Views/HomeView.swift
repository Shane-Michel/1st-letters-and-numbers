import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                SoftBackground()

                VStack(spacing: 34) {
                    Spacer(minLength: 28)

                    VStack(spacing: 12) {
                        Text("First Letters and Numbers")
                            .font(.largeTitle.weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(SoftColors.ink)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Gentle learning for little hands")
                            .font(.title3.weight(.medium))
                            .foregroundStyle(SoftColors.mutedInk)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: 520)

                    VStack(spacing: 18) {
                        NavigationLink {
                            LettersView()
                        } label: {
                            PrimaryNavigationButton(title: "Letters", systemImage: "textformat.abc", color: SoftColors.leaf)
                        }

                        NavigationLink {
                            NumbersView()
                        } label: {
                            PrimaryNavigationButton(title: "Numbers", systemImage: "number", color: SoftColors.sky)
                        }

                        NavigationLink {
                            ParentGateView()
                        } label: {
                            PrimaryNavigationButton(title: "Parents", systemImage: "lock.shield", color: SoftColors.peach)
                        }
                    }
                    .buttonStyle(.plain)

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

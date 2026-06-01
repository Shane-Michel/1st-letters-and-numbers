import SwiftUI

struct LettersView: View {
    @State private var currentIndex = 0

    private let letters = LearningData.letters

    private var currentLetter: LetterItem {
        letters[currentIndex]
    }

    var body: some View {
        ZStack {
            SoftBackground()

            VStack(spacing: 28) {
                Spacer(minLength: 16)

                LearningPanel {
                    Button {
                        playLetterSound()
                    } label: {
                        Text(currentLetter.letter)
                            .font(.system(size: 148, weight: .bold, design: .rounded))
                            .foregroundStyle(SoftColors.leaf)
                            .frame(maxWidth: .infinity, minHeight: 220)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(SoftColors.leaf.opacity(0.11))
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Letter \(currentLetter.letter)")

                    Text(currentLetter.helperText)
                        .font(.title.weight(.semibold))
                        .foregroundStyle(SoftColors.ink)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }

                PreviousNextControls(
                    canGoPrevious: currentIndex > 0,
                    canGoNext: currentIndex < letters.count - 1,
                    previous: showPreviousLetter,
                    next: showNextLetter
                )

                Spacer(minLength: 16)
            }
            .padding(24)
        }
        .navigationTitle("Letters")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func showPreviousLetter() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
    }

    private func showNextLetter() {
        guard currentIndex < letters.count - 1 else { return }
        currentIndex += 1
    }

    private func playLetterSound() {
        // Audio will be added in a later MVP pass.
    }
}

#Preview {
    NavigationStack {
        LettersView()
    }
}

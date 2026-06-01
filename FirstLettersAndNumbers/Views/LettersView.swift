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

                LearningCard(tint: CalmDesign.ColorPalette.gentleGreen) {
                    ProgressPill(
                        text: "Letter \(currentIndex + 1) of \(letters.count)",
                        color: CalmDesign.ColorPalette.gentleGreen
                    )

                    Button {
                        SoundManager.shared.playLetterSound(letter: currentLetter.letter)
                    } label: {
                        Text(currentLetter.letter)
                            .font(.system(size: 176, weight: .bold, design: .rounded))
                            .foregroundStyle(CalmDesign.ColorPalette.gentleGreen)
                            .frame(maxWidth: .infinity, minHeight: 240)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(CalmDesign.ColorPalette.gentleGreen.opacity(0.11))
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Letter \(currentLetter.letter)")

                    Text(currentLetter.helperText)
                        .font(.title.weight(.bold))
                        .foregroundStyle(CalmDesign.ColorPalette.warmText)
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
            .frame(maxWidth: CalmDesign.Layout.screenMaxWidth)
        }
        .navigationTitle("Letters")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func showPreviousLetter() {
        guard currentIndex > 0 else { return }
        SoundManager.shared.playTapSound()
        currentIndex -= 1
    }

    private func showNextLetter() {
        guard currentIndex < letters.count - 1 else { return }
        SoundManager.shared.playTapSound()
        currentIndex += 1
    }
}

#Preview {
    NavigationStack {
        LettersView()
    }
}

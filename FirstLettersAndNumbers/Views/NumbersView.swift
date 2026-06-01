import SwiftUI

struct NumbersView: View {
    @State private var currentIndex = 0

    private let numbers = LearningData.numbers

    private var currentNumber: NumberItem {
        numbers[currentIndex]
    }

    var body: some View {
        ZStack {
            SoftBackground()

            VStack(spacing: 28) {
                Spacer(minLength: 16)

                LearningCard(tint: CalmDesign.ColorPalette.gentleBlue) {
                    ProgressPill(
                        text: "Number \(currentIndex + 1) of \(numbers.count)",
                        color: CalmDesign.ColorPalette.gentleBlue
                    )

                    Button {
                        SoundManager.shared.playNumberSound(number: currentNumber.value)
                    } label: {
                        Text("\(currentNumber.value)")
                            .font(.system(size: 164, weight: .bold, design: .rounded))
                            .foregroundStyle(CalmDesign.ColorPalette.gentleBlue)
                            .frame(maxWidth: .infinity, minHeight: 220)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(CalmDesign.ColorPalette.gentleBlue.opacity(0.12))
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Number \(currentNumber.word)")

                    Text(currentNumber.word)
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(CalmDesign.ColorPalette.warmText)

                    DotCounter(count: currentNumber.value)
                }

                PreviousNextControls(
                    canGoPrevious: currentIndex > 0,
                    canGoNext: currentIndex < numbers.count - 1,
                    previous: showPreviousNumber,
                    next: showNextNumber
                )

                Spacer(minLength: 16)
            }
            .padding(24)
            .frame(maxWidth: CalmDesign.Layout.screenMaxWidth)
        }
        .navigationTitle("Numbers")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func showPreviousNumber() {
        guard currentIndex > 0 else { return }
        SoundManager.shared.playTapSound()
        currentIndex -= 1
    }

    private func showNextNumber() {
        guard currentIndex < numbers.count - 1 else { return }
        SoundManager.shared.playTapSound()
        currentIndex += 1
    }
}

private struct DotCounter: View {
    let count: Int

    private let columns = Array(repeating: GridItem(.fixed(34), spacing: 12), count: 5)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(0..<count, id: \.self) { _ in
                Circle()
                    .fill(CalmDesign.ColorPalette.softPeach.opacity(0.82))
                    .frame(width: 34, height: 34)
                    .accessibilityHidden(true)
            }
        }
        .frame(minHeight: 80)
        .accessibilityLabel("\(count) counting dots")
    }
}

#Preview {
    NavigationStack {
        NumbersView()
    }
}

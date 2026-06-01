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

                LearningPanel {
                    Button {
                        playNumberSound()
                    } label: {
                        Text("\(currentNumber.value)")
                            .font(.system(size: 140, weight: .bold, design: .rounded))
                            .foregroundStyle(SoftColors.sky)
                            .frame(maxWidth: .infinity, minHeight: 190)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(SoftColors.sky.opacity(0.12))
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Number \(currentNumber.word)")

                    Text(currentNumber.word)
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(SoftColors.ink)

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
        }
        .navigationTitle("Numbers")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func showPreviousNumber() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
    }

    private func showNextNumber() {
        guard currentIndex < numbers.count - 1 else { return }
        currentIndex += 1
    }

    private func playNumberSound() {
        // Audio will be added in a later MVP pass.
    }
}

private struct DotCounter: View {
    let count: Int

    private let columns = Array(repeating: GridItem(.fixed(34), spacing: 12), count: 5)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(0..<count, id: \.self) { _ in
                Circle()
                    .fill(SoftColors.peach.opacity(0.82))
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

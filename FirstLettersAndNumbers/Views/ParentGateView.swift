import SwiftUI

struct ParentGateView: View {
    @State private var answer = ""
    @State private var isUnlocked = false
    @State private var showError = false
    @AppStorage("soundEnabled") private var soundEnabled = true
    @AppStorage("musicEnabled") private var musicEnabled = false

    var body: some View {
        ZStack {
            SoftBackground()

            if isUnlocked {
                settingsContent
            } else {
                gateContent
            }
        }
        .navigationTitle("Parents")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var gateContent: some View {
        VStack(spacing: 24) {
            Spacer(minLength: 16)

            LearningPanel {
                Image(systemName: "lock.shield")
                    .font(.system(size: 54, weight: .semibold))
                    .foregroundStyle(SoftColors.peach)
                    .accessibilityHidden(true)

                Text("Parent Check")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(SoftColors.ink)

                Text("What is 3 + 4?")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(SoftColors.mutedInk)

                TextField("Answer", text: $answer)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 220)

                Button("Continue", action: checkAnswer)
                    .buttonStyle(SoftControlButtonStyle(color: SoftColors.peach))
                    .frame(maxWidth: 260)

                if showError {
                    Text("Please try again.")
                        .font(.headline)
                        .foregroundStyle(SoftColors.peach)
                }
            }

            Spacer(minLength: 16)
        }
        .padding(24)
    }

    private var settingsContent: some View {
        VStack(spacing: 24) {
            Spacer(minLength: 16)

            LearningPanel {
                Text("Settings")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(SoftColors.ink)

                VStack(spacing: 18) {
                    Toggle("Sound", isOn: $soundEnabled)
                    Toggle("Music", isOn: $musicEnabled)
                }
                .font(.title3.weight(.semibold))
                .toggleStyle(.switch)
                .tint(SoftColors.leaf)
                .padding(.horizontal, 8)

                Text("This app does not collect personal data.")
                    .font(.body.weight(.medium))
                    .foregroundStyle(SoftColors.mutedInk)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer(minLength: 16)
        }
        .padding(24)
    }

    private func checkAnswer() {
        let trimmedAnswer = answer.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedAnswer == "7" {
            showError = false
            isUnlocked = true
        } else {
            showError = true
        }
    }
}

#Preview("Gate") {
    NavigationStack {
        ParentGateView()
    }
}

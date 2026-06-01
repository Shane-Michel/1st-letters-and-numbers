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
        .onChange(of: musicEnabled) { _, isEnabled in
            if isEnabled {
                SoundManager.shared.playBackgroundMusic()
            } else {
                SoundManager.shared.stopBackgroundMusic()
            }
        }
        .onChange(of: soundEnabled) { _, isEnabled in
            if !isEnabled {
                SoundManager.shared.stopEffectSounds()
            }
        }
    }

    private var gateContent: some View {
        VStack(spacing: 24) {
            Spacer(minLength: 16)

            LearningPanel {
                Image(systemName: "lock.shield")
                    .font(.system(size: 54, weight: .semibold))
                    .foregroundStyle(CalmDesign.ColorPalette.softPeach)
                    .accessibilityHidden(true)

                Text("Parent Check")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(CalmDesign.ColorPalette.warmText)

                Text("What is 3 + 4?")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(CalmDesign.ColorPalette.mutedText)

                TextField("Answer", text: $answer)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 220)

                Button("Continue", action: checkAnswer)
                    .buttonStyle(LargeToddlerButtonStyle(color: CalmDesign.ColorPalette.softPeach, minHeight: 62))
                    .frame(maxWidth: 260)

                if showError {
                    Text("Try again.")
                        .font(.headline)
                        .foregroundStyle(CalmDesign.ColorPalette.softPeach)
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
                    .foregroundStyle(CalmDesign.ColorPalette.warmText)

                VStack(spacing: 18) {
                    Toggle("Sound", isOn: $soundEnabled)
                    Toggle("Music", isOn: $musicEnabled)
                }
                .font(.title3.weight(.semibold))
                .toggleStyle(.switch)
                .tint(CalmDesign.ColorPalette.gentleGreen)
                .padding(.horizontal, 8)

                Text("This app does not collect personal data.")
                    .font(.body.weight(.medium))
                    .foregroundStyle(CalmDesign.ColorPalette.mutedText)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer(minLength: 16)
        }
        .padding(24)
    }

    private func checkAnswer() {
        SoundManager.shared.playTapSound()

        let trimmedAnswer = answer.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedAnswer == "7" {
            showError = false
            isUnlocked = true
            SoundManager.shared.playSuccessSound()
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

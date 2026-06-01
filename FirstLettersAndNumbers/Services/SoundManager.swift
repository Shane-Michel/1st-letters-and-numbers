import AVFoundation
import Foundation

@MainActor
final class SoundManager {
    static let shared = SoundManager()

    private let defaults: UserDefaults
    private var effectPlayers: [String: AVAudioPlayer] = [:]
    private var backgroundPlayer: AVAudioPlayer?
    private var hasConfiguredAudioSession = false

    private var soundEnabled: Bool {
        defaults.object(forKey: "soundEnabled") as? Bool ?? true
    }

    private var musicEnabled: Bool {
        defaults.object(forKey: "musicEnabled") as? Bool ?? false
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func playLetterSound(letter: String) {
        guard soundEnabled else { return }

        let normalizedLetter = letter.lowercased()
        playEffect(named: "letter_\(normalizedLetter)")
    }

    func playNumberSound(number: Int) {
        guard soundEnabled else { return }

        playEffect(named: "number_\(number)")
    }

    func playTapSound() {
        guard soundEnabled else { return }

        playEffect(named: "tap", volume: 0.35)
    }

    func playSuccessSound() {
        guard soundEnabled else { return }

        playEffect(named: "success", volume: 0.45)
    }

    func stopAllSounds() {
        stopEffectSounds()
        stopBackgroundMusic()
    }

    func stopEffectSounds() {
        effectPlayers.values.forEach { player in
            player.stop()
            player.currentTime = 0
        }
    }

    func playBackgroundMusic() {
        guard musicEnabled else { return }

        configureAudioSessionIfNeeded()

        if let backgroundPlayer {
            backgroundPlayer.numberOfLoops = -1
            backgroundPlayer.volume = 0.18
            backgroundPlayer.play()
            return
        }

        guard let player = makePlayer(named: "calm_background") else { return }

        player.numberOfLoops = -1
        player.volume = 0.18
        backgroundPlayer = player
        player.play()
    }

    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
        backgroundPlayer?.currentTime = 0
    }

    private func playEffect(named fileName: String, volume: Float = 0.55) {
        configureAudioSessionIfNeeded()

        if let player = effectPlayers[fileName] {
            player.stop()
            player.currentTime = 0
            player.volume = volume
            player.play()
            return
        }

        guard let player = makePlayer(named: fileName) else { return }

        player.volume = volume
        effectPlayers[fileName] = player
        player.play()
    }

    private func makePlayer(named fileName: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            return nil
        }

        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            return player
        } catch {
            return nil
        }
    }

    private func configureAudioSessionIfNeeded() {
        guard !hasConfiguredAudioSession else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, options: [.mixWithOthers])
            hasConfiguredAudioSession = true
        } catch {
            return
        }
    }
}

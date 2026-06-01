# AGENTS.md — First Letters and Numbers

## Project
Build a calm iOS learning app for toddlers called **First Letters and Numbers**.

## Platform
- Native iOS app
- SwiftUI
- iPhone and iPad support
- Portrait-first layout
- No backend required for MVP

## Core Goal
Help toddlers learn letters and numbers in a simple, calm, non-overstimulating way.

## Design Rules
- Soft colors
- Large tap targets
- Simple screens
- Minimal animation
- No flashing effects
- No loud sounds
- No ads
- No external links for children
- No user accounts
- No data collection
- No third-party analytics

Apple Kids Category apps must avoid external links, purchases, and distractions unless protected by a parental gate, and should not include third-party ads or analytics. Follow Apple’s Kids Category safety/privacy expectations.  [oai_citation:0‡Apple Developer](https://developer.apple.com/app-store/review/guidelines/?utm_source=chatgpt.com)

## MVP Screens
1. Home Screen
   - App title
   - Letters button
   - Numbers button
   - Parent button

2. Letters Screen
   - Show one big letter at a time
   - Example: A
   - Text: “A is for Apple”
   - Previous / Next buttons
   - Tap letter to hear sound

3. Numbers Screen
   - Show numbers 1–10
   - Example: 3
   - Text: “Three”
   - Show simple countable objects
   - Previous / Next buttons

4. Parent Screen
   - Protected by a simple parental gate
   - Toggle sound on/off
   - Toggle music on/off
   - About/privacy text

## Code Rules
- Use clear SwiftUI components
- Keep data in simple local arrays/models
- No networking
- No tracking
- No login
- No in-app purchases for MVP
- Keep files organized by feature

## Tone
The app should feel gentle, safe, warm, and slow-paced.
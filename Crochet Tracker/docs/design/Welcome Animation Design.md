# Welcome Animation Design

## Purpose

Create a welcome screen that appears between sign-in and the main Cozy Crochet app for first-time users.

## App Flow

Sign In  
↓  
Welcome Screen  
↓  
Main App (`ContentView`)

For returning users:

Sign In  
↓  
Main App (`ContentView`)

The welcome screen should only appear the first time after sign-in.

## Welcome Screen

The welcome screen will introduce Cozy Crochet and briefly explain the project's current features:

- Browse crochet projects
- Filter projects by difficulty
- Browse projects by category
- View project details
- View YouTube tutorial thumbnails
- Open the corresponding YouTube tutorial

The screen will use the same cozy visual style as the existing app.

## Visual Design

### Background
- Warm cream background
- Soft, minimal appearance
- Rounded UI elements
- Subtle shadows

### Yarn Animation

A rolling ball of yarn will be the main animation.

Color palette:
- Warm brown
- Warm orange
- A blended brown/orange appearance

Animation behavior:
1. The yarn ball appears near the beginning of the welcome animation.
2. It rolls across/into the welcome screen.
3. The yarn ball rotates as it rolls.
4. It gently settles into its final position.
5. The animation remains subtle so it does not distract from the welcome content.

The animation should be implemented using SwiftUI rather than an external video.

## Welcome Content

The screen will contain:

### App Name
**🧶 Cozy Crochet**

### Introduction
A short explanation of the purpose of the app.

### Feature Highlights
A small set of visual feature descriptions explaining what users can currently do.

### Button
**Get Started →**

Tapping the button takes the user to `ContentView`.

## State Management

A local `@AppStorage` value will track whether the user has already viewed the welcome screen.

Example state:

`hasSeenWelcome`

Initial value:

`false`

After the user taps **Get Started →**:

`hasSeenWelcome = true`

This prevents the welcome screen from appearing every time the app launches.

## Files

### New File
`WelcomeView.swift`

Responsible for:
- Welcome screen UI
- Yarn animation
- Get Started button

### Existing File
`Crochet_TrackerApp.swift`

Responsible for:
- Routing between sign-in, welcome screen, and main app

### Existing Files That Should Not Need Changes For This Feature

- `Project.swift`
- `ProjectDetailView.swift`
- `FirestoreManager.swift`

## Implementation Goal

The final experience should feel like a polished introduction to Cozy Crochet while remaining consistent with the existing app's warm, cozy design.
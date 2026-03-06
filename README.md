# MusicGPT-Assessment

## Overview

MusicGPT is an iOS application built as part of the technical assessment project.  
The app allows users to generate AI-based music tracks using prompts and play them using an integrated music player interface.
**Minimum Deployment Target:** iOS 17+

---

## Tech Stack

- **Language:** Swift  
- **Frameworks:** SwiftUI, Combine
- **Architecture Pattern:** MVVM (Model-View-ViewModel)
- **Concurrency & Threading:** Async / Await, GCD
- **Development Environment:** Xcode

---

## Architecture

The project follows the **MVVM architecture** to maintain separation of concerns.

### Model Layer
Responsible for data representation.

Examples:
- GeneratedItem + Sample Data related to generated audio items
- GeneratingItem

---

### View Layer
Handles UI rendering and user interactions.


Examples:
- GeneratedItemsListView  
- GeneratingItemView  
- MusicPlayerView   

Views are kept lightweight and delegate business logic to ViewModels.

---

### ViewModel Layer
Contains application business logic and state management.

Responsibilities include:

- Managing generated and generating items list workflow
- Updating UI state dynamically
- Handling MusicPlayer state and track

---

## ✨ Key Features

- Easy and engaging AI music generation workflow simulation  
- Real-time generation progress indicator
- Interactive Music player interface
- Smooth transition animations

---

## How to Build and Run

### 1. Clone the Repository

### 2. Open the Project in Xcode
- Open MusicGPT-Assessment -> MusicGPT-Assessment.xcodeproj
or 
- enter command 'xed MusicGPT-Assessment/MusicGPT-Assessment.xcodeproj' from project root

### 3. Select iOS Device or Simulator

### 4. Build and Run
- Press ⌘ + R in Xcode
or
- Click the ▶️ Run button in Xcode toolbar

---

## Project Structure

```bash
MusicGPT-Assessment
│
├── Models
│   ├── GeneratedItem.swift
│   └── GeneratingItem.swift
│
├── Utils
│   └── HapticGenerator.swift
│
├── ViewModel
│   ├── GeneratedItemsListViewModel.swift
│   └── MusicPlayerViewModel.swift
│
├── Views
│   ├── CreateButton
│   │   └── CreateButtonView.swift
│   │
│   ├── CustomTabView
│   │   └── CustomTabView.swift
│   │
│   ├── GeneratedItemsList
│   │   ├── GeneratedItemsListView.swift
│   │   ├── GeneratedItemView.swift
│   │   ├── GeneratingItemImageRectangleView.swift
│   │   ├── GeneratingItemView.swift
│   │   └── GenerationFailureView.swift
│   │
│   ├── KeyboardGlow
│   │   └── KeyboardGlowView.swift
│   │
│   ├── MusicPlayer
│   │   ├── AudioControlView.swift
│   │   ├── MusicPlayerView.swift
│   │   └── TransparentBlurView.swift
│   │
│   └── TextField
│       └── FloatingTextField.swift
│
├── App Files
│   ├── AppConstants.swift
│   ├── Assets.xcassets
│   ├── MainTabView.swift
│   └── MusicGPT_AssessmentApp.swift
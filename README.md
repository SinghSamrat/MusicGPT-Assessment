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


### View Layer
Handles UI rendering and user interactions.


Examples:
- GeneratedItemsListView  
- GeneratingItemView  
- MusicPlayerView   

Views are kept lightweight and delegate business logic to ViewModels.


### ViewModel Layer
Contains application business logic and state management.

Responsibilities include:

- Managing generated and generating items list workflow
- Updating UI state dynamically
- Handling MusicPlayer state and track

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

## Animation Decisions
- Most animations and visual effects are implemented using SwiftUI’s native animation system to maintain a declarative and lightweight UI architecture.

- The blur effect used in the interfaces like **MusicPlayer** is implemented using UIKit’s **UIVisualEffectView**, bridged into SwiftUI through the **UIViewRepresentable** protocol. This allows finer control over blur behavior that is not directly exposed through standard SwiftUI APIs.

- The **Keyboard** and **Textfield** glow effects are created using softly blurred **LinearGradient** and **AngularGradient** layers. These gradients are animated using infinitely looping linear easing curves applied to their rotation, opacity, and blur radius.

- The **Loading** animation effect is created using similar softly blurred **LinearGradient** and **RadialGradient** layers which are animated using **easeInOut** easing curves applied to their rotation, opacity, and radii coupled with the progress property.

- UI elements such as the **MusicPlayer** and **CreateButton** use **spring** easing on animations to alter their y-offset to achieve bouncy animation. 

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
│
├── AppConstants.swift
├── Assets.xcassets
├── MainTabView.swift
├── MusicGPT_AssessmentApp.swift
# Flutter Animations

A growing Flutter repo of small animation demos built for practice, repeatable sharing, and public posts on LinkedIn and GitHub.

## Structure

```text
lib/
  app/
    app.dart
    router.dart
  core/
    theme/
    widgets/
  features/
    home/
      models/
      views/
      widgets/
  demos/
    pulse_orb/
      view.dart
      widget.dart
assets/
  gifs/
  images/
```

## Workflow

1. Add a new demo folder under `lib/demos/`.
2. Build the animation in its own `view.dart` and `widget.dart`.
3. Register the route in `lib/app/router.dart`.
4. Add a `DemoItem` entry in `lib/features/home/views/home_screen.dart`.
5. Save a preview GIF or screenshot in `assets/gifs/` or `assets/images/`.
6. Update this README when you publish the demo.

## Current Demo

- `Pulse Orb`: starter looping animation used as the template for future demos.

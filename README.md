# Flutter Animations

A growing Flutter repo of small animation demos.

## Structure

```text
lib/
  app/
    app.dart
    router.dart
  features/
    home/
      models/
      views/
      widgets/
  demos/
```

## Workflow

1. Add a new demo folder under `lib/demos/`.
2. Build the animation in its own `view.dart` and `widget.dart`.
3. Register the route in `lib/app/router.dart`.
4. Add a `DemoItem` entry in `lib/features/home/views/home_screen.dart`.
5. Update this README when you publish the demo.

## Animations Gallery

<table>
  <tr>
    <td align="center" width="300">
      <strong>Magic Wand Reveal</strong><br/><br/>
      <img src="assets/gifs/magicWandReveal.gif" alt="Magic Wand Reveal" width="260"/><br/><br/>
      <a href="lib/demos/magic_wand_reveal/widget.dart">View Source</a>
    </td>
    <td align="center" width="300">
      <strong>Mood Interaction</strong><br/><br/>
      <img src="assets/gifs/moodInteraction.gif" alt="Mood Interaction" width="260"/><br/><br/>
      <a href="lib/demos/mood_interaction/">View Source</a>
    </td>
  </tr>
</table>

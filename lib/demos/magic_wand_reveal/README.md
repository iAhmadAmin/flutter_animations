# Magic Wand Reveal Demo

This demo builds a full-screen "hidden content" effect where a white mask covers the screen and a movable wand reveals only the area around it.

## Core Idea

The effect is built from three layers inside a `Stack` in [widget.dart](/Users/ammy/Desktop/Flutter/flutter_animations/lib/demos/magic_wand_reveal/widget.dart):

- The real content screen at the bottom.
- A white overlay painted above it.
- A wand widget drawn on top and positioned at the reveal center.

Because the content is underneath the white overlay, the user only sees text where the overlay is punched out.

## State

`_MagicWandRevealDemoState` keeps the interaction state:

- `_revealCenter`: current position of the reveal and wand.
- `_revealRadius`: current size of the reveal area.
- `_radiusAtScaleStart`: radius captured at the beginning of a pinch gesture.

The initial center is set lazily in `_syncInitialCenter(...)` after the layout size is known.

## Gesture Handling

The interaction is implemented with a single `GestureDetector` using `onScaleStart` and `onScaleUpdate`.

This is useful because Flutter's scale gesture already combines:

- one-finger drag
- two-finger pinch

The update flow is:

1. Convert the gesture focal point from global coordinates into the demo's local coordinates with `_globalToLocal(...)`.
2. Clamp that position with `_clampCenter(...)` so the wand stays on-screen.
3. Always move `_revealCenter` to the new focal point.
4. If there are two or more pointers, update `_revealRadius` using `details.scale`.

That means:

- one finger moves the wand
- two fingers move and resize the reveal

## Reveal Mask

The reveal effect is painted by `MagicRevealPainter`.

The painter works like this:

1. Paint a full-screen white rectangle.
2. Open a temporary layer with `canvas.saveLayer(...)`.
3. Draw the reveal shape using `BlendMode.dstOut`.
4. Restore the layer.

`dstOut` removes pixels from the white mask, which makes the content underneath visible.

This is different from fading text opacity. The text is always fully rendered; the overlay is what changes.

## Organic Edge

The reveal is intentionally not a perfect circle.

`_buildOrganicRevealPath()` walks around a 360-degree loop and changes the radius slightly using sine and cosine terms:

- `sin(angle * 3)`
- `cos(angle * 5)`
- `sin(angle * 9)`

Those small variations produce an uneven boundary so the reveal feels more natural and less geometric.

After the irregular path is drawn, a second `dstOut` pass adds soft falloff using a radial gradient. This creates the blurred feathered edge around the reveal.

So the final edge comes from two parts:

- an irregular main silhouette
- a larger soft feather around it

## Content Layer

`_RevealContent` is just the hidden page underneath the mask.

Important choices in this demo:

- explicit white background so the revealed area stays white
- Georgia text styling for the app-bar title and body copy
- multiple paragraphs so the reveal has content across the screen

The app-bar row is part of `_RevealContent` instead of using a normal `Scaffold.appBar`. That keeps the title area under the same reveal mask as the body.

## Positioning the Wand

The wand is positioned with:

- `Align(alignment: Alignment.topLeft)`
- `Transform.translate(offset: revealCenter)`

Because the wand and painter both use the same `revealCenter`, the wand always sits directly over the revealed area.

## Why This Structure Works Well

This demo is easy to extend because the responsibilities are separated:

- `MagicWandRevealDemo`: owns gesture state and layering
- `MagicRevealPainter`: controls how the reveal hole looks
- `_RevealContent`: controls what is being hidden and revealed

If you want to modify the effect later, the safest rule is:

- change `_RevealContent` to alter what the user sees
- change `MagicRevealPainter` to alter how the reveal looks
- change the gesture code to alter how the reveal moves or scales

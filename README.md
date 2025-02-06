# KonamiCode for Godot
<p align="center">
    <img src="addons/konamicode/icon.svg" alt="Logo" width="200">
    <br />
    <i>Up, Up, Down, Down...</i>
</p>


A very simple addon that adds a new Node that listens for a string of key combinations.

I'm the type of person that loves putting random cryptic secrets in my projects, so I find myself using something like this often. I figured I'd share it with the community as someone might have a use for it.

## Using it
KonamiCode comes with a single new Node: KonamiCode. The exported variables all have pretty self-explanatory names, but just to cover my bases:

You can either set your own code in the exported `code_override` variable, or just use the default, which is the traditional Konami Code.

When that's done, set up if it should be active by default with the `active` prop, and if it should only fire once with the `fire_only_once` prop.

And finally, just connect the `success` signal!

Easy peasy. Now add your own secrets (or just use it for other key-combination related things)!

## Planned features:
- A toggle so you can use controller inputs, not just keyboard.
- A timer so you have to input buttons in quick succession.
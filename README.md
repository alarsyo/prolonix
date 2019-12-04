# prolonix

Experiment to evaluate NixOS as a durable solution for
[Prologin](https://prologin.org)'s regional events.

## Building:

With `nix` installed:

```bash
$ nix-build prolo.nix
```

The resulting image can be found in `result/iso/nixos-*.iso`.

## TODO

 - [ ] Create a prologin user
 - [ ] Install required languages and editors
 - [ ] Rice the image with Prologin wallpapers / greeters
 - [ ] Test it ?

# MangoHUD

## Configuration

MangoHud can be configured just like the [instructions](https://github.com/flightlessmango/MangoHud#hud-configuration) mentioned by the project with a few changes:

1. You can either create a configuration file in: `~/.var/app/com.valvesoftware.Steam/config/MangoHud/MangoHud.conf`

1. Or you can give the flatpak access to filesystem on the host: `flatpak override --user --filesystem=xdg-config/MangoHud:ro com.valvesoftware.Steam` if you prefer to keep the config file there.

### Using with Vulkan applications

Run any Flatpak with `MANGOHUD=1` specified on the command line. For
convenience, you can specify environment variable overrides for a given Flatpak
so that this variable is always passed when running a specific Flatpak.

For example, to enable MangoHUD on all Vulkan applications (including DXVK) running within Steam:

```
flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam
```

This does **not** affect OpenGL applications, which don't obey the `MANGOHUD`
environment variable. To use MangoHUD with Flatpaks that use OpenGL, see the
section below instead.

### Using with OpenGL applications

Despite this repository's name, you can also use this Flatpak to display
MangoHUD on OpenGL applications running within a Flatpak. To do so, you will
need to know the binary name used by a Flatpak. This is generally the
application's name in lowercase, but in certain cases, you will need to look up
the manifest used to build the Flatpak and search for the `command:` line ([like
this](https://github.com/flathub/net.minetest.Minetest/blob/444fe63f5e95424facc99d2f910d27a3024c8258/net.minetest.Minetest.yaml#L5)).

Then run the Flatpak from the command line:

```command
flatpak run --command=/usr/lib/extensions/vulkan/MangoHud/bin/mangohud <Flatpak ID> <binary name within the Flatpak>
```

For example, to run [Minetest](https://flathub.org/apps/details/net.minetest.Minetest) with MangoHUD:

```command
flatpak run --command=/usr/lib/extensions/vulkan/MangoHud/bin/mangohud net.minetest.Minetest minetest
```

## Resources

- [MangoHUD Homepage](https://github.com/flightlessmango/MangoHud)
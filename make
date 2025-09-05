#!/bin/sh
flatpak-builder --repo=repo --install-deps-from=flathub --force-clean build org.freedesktop.Platform.VulkanLayer.MangoHud.yml

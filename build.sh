#!/usr/bin/env bash
flatpak run org.flatpak.Builder --user --install --install-deps-from=flathub --force-clean build com.bay12games.DwarfFortress.yaml
flatpak run org.flatpak.Builder --repo=repo --force-clean build com.bay12games.DwarfFortress.yaml
flatpak build-bundle repo com.bay12games.DwarfFortress.flatpak com.bay12games.DwarfFortress

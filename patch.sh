#!/bin/bash

mkdir dist

for Fonts in $(ls Fonts); do
    unzip enmity.ipa
    cp -rf Fonts/${Fonts}/* Payload/Discord.app/
    zip -r dist/${Fonts}cord.ipa Payload
    rm -rf Payload
done

for Pack in $(ls Packs); do
    for Fonts in $(ls Fonts); do
        unzip enmity.ipa
        cp -rf Fonts/${Fonts}/* Payload/Discord.app/
        cp -rf Packs/${Pack}/* Payload/Discord.app/assets/
        zip -r dist/${Fonts}cord-${Pack}.ipa Payload
        rm -rf Payload
    done
done

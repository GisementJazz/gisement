#!/usr/bin/env python3

import os

report_file = "dl.md"

try:
    os.remove(report_file)
except OSError:
    pass

def slug(song):
    return song.translate(str.maketrans("'ï", "_i"))

def song_and_slug(song):
    return (song, slug(song))

def pdf_url(slug, key):
    return "pdf/" + slug + "." + key + ".pdf"

def pdf_link(slug, key):
    return "[" + key + "](" + pdf_url(slug, key) + ")"

def links(slug):
    return str.join(" ", [pdf_link(slug, key) for key in ["C", "Bb", "Eb"]])

with open("liste.txt") as f:
    content = [song_and_slug(line.strip()) for line in f.readlines()]

with open(report_file, "a") as f:
    f.write("# Téléchargements\n\n")
    f.write("## Books\n\n")
    f.write("* [book en Ut](books/book.C.pdf)\n")
    f.write("* [book en Bb](books/book.Bb.pdf)\n")
    f.write("* [book en Eb](books/book.Eb.pdf)\n")
    f.write("\n")
    f.write("## Individuels\n\n")
    for song, slug in content:
        f.write("* " + song + " (" + links(slug) + ")\n")

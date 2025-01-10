#!/bin/bash

# example usage:
# 	./color.sh toast_tex_ink.png toast_tex.png

export BLACK="#000000"

function color () {
	FILE_INK=$1
	FILE_TEX=$2
	COLOR=$3
	FILE_OUT=$4

	magick "$FILE_INK" -channel RGB +level-colors "${BLACK},${COLOR}" -channel RGBA "$FILE_TEX" -background none -layers flatten "$FILE_OUT"
}

NAMES=("pink"		"green"		"blue"		"ornge"		"trqse"		"prple"		"yllow"		"ltblu"		"mznta")
COLORS=("#cf0466"	"#17a80d"	"#4a14aa"	"#fb5c03"	"#08b672"	"#5f0fb4"	"#dea801"	"#007ac9"	"#b1008d")

INK=$1
TEX=$2

OUT=$(basename -s .png $TEX)

mkdir -p out

for i in $(seq 0 $((${#NAMES[@]}-1))); do
	color $INK $TEX ${COLORS[$i]} ${OUT}.${NAMES[$i]}.png
done




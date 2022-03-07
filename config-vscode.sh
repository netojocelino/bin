#!/bin/sh


C_BOLD=1
C_H1='1;32'
C_H2='1;34'
C_ERROR='97;41'
C_WARN='30;43'

color () {
    printf '\033[%sm%s\033[0m' "$1" "$2"
}

echoH1 () {
    echo "$(color "$C_H1" '==>') $(color "$C_BOLD" "$1")"
}

echoH2 () {
    echo "  $(color "$C_H2" '->') $(color "$C_BOLD" "$1")"
}

error () {
    >&2 echo "$(color "$C_ERROR" ' ERROR ') $2"
    exit "$1"
}

warn () {
    >&2 echo "$(color "$C_WARN" ' WARN ') $1"
}


EXTENSIONS=(
	"editorconfig.editorconfig"
	"eamodio.gitlens"
	"mhutchie.git-graph"
	"junstyle.php-cs-fixer"
	"bmewburn.vscode-intelephense-client"
	"humao.rest-client"
	"octref.vetur"
	"timonwong.shellcheck"
	"wakatime.vscode-wakatime"
	

)

for (( i=0; i<${#EXTENSIONS[@]}; i++))
do
	echoH1 "code --install-extension "${EXTENSIONS[$i]}"\n"
	code --install-extension "${EXTENSIONS[$i]}"
done

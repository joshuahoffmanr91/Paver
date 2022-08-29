#!/bin/bash

Main () {

shopt -s extglob
mapfile O_ < ${@-$0}
N=" ${O_[@]} " && N="${N//$'\n'/\ $'\n'\ }" && N="${N//$'\t'/    }"
S_=(${N})
A_=(${S_[@]//?()/\\})
eval eval declare -A B_[\\\${A_[{0..${#A_[@]}}]%\\}]+=\\\ \$[A++]
eval eval C_[\\\${#O_[{${#O_[@]}..0}]}]+=\"\\\ \\\${O_[A--]}\"
D_=(${!C_[@]})

Paver () {

unset {{A..Z}{_,},{}a..z}}

	while (( ++A <= ${#O_[@]} )); do
	[[ "${O_[A]//[[:alpha:]|\ |'_']}" = "(){" ]] && {
	Stack[++E-F]+=\ $A ; } || {
	[[ "${O_[A]//[\ ]}" = "}" ]] &&\
 	Morter[++G]="${O_[@]:$[D=${Stack[E-F++]##*\ }]:$[C=A-D+1]}" &&\
	[[ $(cksum <<<"${Morter[G]}") != ${O_[A]//[!0-9|\ ]} ]] && {

		while (( ++D < A )); do
		unset Padds
		eval declare Padds[{${D_[-1]}..${#Hate}}]=" "
		echo -en "${Hate//\\n}${Padds[@]}\#\\n"
		done

	} || ((H++)) ;}
	done

return $[H+E]

}

Compress () {


unset {{A..Z}{_,},{a..z}}

        for b in ${F_[@]%-}; do

                for c in ${B_[$b-]}; do
                ! [[ " ${H_[@]} " == *" ${A_[--A-1]} "* ]] && H_+=("${A_[A-1]}")
                [[ -z $e ]] && eval {d,e}=\$c && continue
                N="${N/" $b "/\ $[c-d]\ }"
                d=$c
                done

        N="${N/" $b "/\ 0$e\ }"
        unset d e
        done

eval echo ${H_[@]} > $1.isf
cat <<<"$N" >> $1.isf

}

Decompress () {

unset {{A..Z}{_,},{a..z}}
Slip=(${O_[0]})
Skip=(${O_[@]:1:${#O_[@]}})

        for (( Road=0; ${#Skip[@]} >= Road; Road++ )); do
        [[ ${Skip[Road]::1} == 0 ]] || continue && ((++A)) &&\
        [[  ${Skip[Road]#1} == $Road ]] && Leap[Road]=${Slip[-A]} &&\
        continue || Path=${Skip[Road]#0}

                until (( ${Walk:=0} == $Road )); do
                Path=${Skip[$((Walk+=Path))]/-}
                Leap[Walk]=${Slip[-A]}
                done

        unset Path Walk
        done

Stand="${O_[@]:1}"
eval Runs="\"${Stand//+([0-9|-])/\$\{Leap\[\$\(\(Z++\)\)\]\}}\""
cat <<<"$Runs" >> ${1%%.*}_$(date +'%s').${1#*.}

}

Abstract () {

        Encode () {

        unset {A..Z}{_,} {a..z}
        [[ $1 = P ]] && { read -sp "?:" a
        } || a="$(cat <<<${@:2})"
        eval A_+=(\$\'\\\\\\{1,0}{0..7}{0..7}\')
        B_=(${A_[@]//[\\|\*|[:cntrl:]]/})
        eval declare -A C_[\${B_[D++]/#/\\\\}]={00..95}
        eval C_[{95..00}]=${B_[$((--D))]/#/\\}
        C_+=([$'\t']=96 [$'\n']=99 [' ']=98 [\*]=97 [99]=$'\n' [97]=\* [98]=' ' [96]=$'\t')
        [[ $1 =~ (F|P) ]] && X=1

                for (( A=${X:=2}-X; A <= ${#a}; A=A+X )); do
                echo -n "${C_["${a:$A:$X}"]}"
                done

        }

        Inflation () {

        Rain=$1
        shopt -s extglob
        declare -g Crop=(${2//?()/\ })
        eval declare -i C+=\({\${#{1,2}}\ ,\$[\${{1,2}//?\(\)/+}]\ }\)

                Dust () {

                eval eval C[++Y%10]+=\\\${C[{0..4}]:{${#C[Y++]}..0}:1}
                eval eval Till=\( \{\$[++C%2]..\${\#Crop[@]}..{2,2,\${C[{0..4}]:=2}}\} \)
                eval eval Crop[\\\${Till[{0..${#Till[@]}}%${#Crop[@]}]}]+=\${Crop[X++%${#Crop[@]}]}
                Crop=(${Crop[@]//?()/\ })

                }

        Dust

                while [[ ${#Crop[@]} -le $1 ]]; do
                ((C+=${C[C++%3+1]}%10))

                        for Grow in ${Crop[@]/0/1}; do
                        ((Soil+=${Soil}${Crop[@]//?()/+}))
                        ((Seed=${#Crop[@]}*$[Seed%10+1]/10))
                        Root=${Soil:$[E=${#Soil}*$[Soil%10+1]/10]}
                        Leaf=${Soil::$[E-$[Soil%7==6]]}${Root}
                        Crop[$Seed]+=$((${Leaf//?()/+}0))
                        (( $Soil < 0 )) && break
                        done

                Crop=(${Crop[@]//?()/\ })
                (( ++C%25 )) && Dust || (( ++C%5 )) && Crop+=(${Crop[@]})
                Crop=(${Crop[@]:-${A}})
                done

        eval echo \${Crop[@]::$1}

        }

shopt -s extglob
unset {A..Z}{_,} {a..z} Ext
mapfile Level < $1
[[ ${Ext:=${1##*.}} != ten ]] && {
Level[0]="$(Encode F ${Level[0]})"
Sweet="${Level[@]}" ; } || Sweet="$(cat $1)"
Build=(${Level[@]//?()/\ })
Minds=($(Inflation ${#Build[@]} $(Encode P)))

        while (( $((V=W++)) < ${#Build[@]} )); do
        A=${Build[V]} && B=${Minds[V]}
        [[ $Ext = ten ]] && Rests[V]=$(( $[E=$[D=A+B+E]>9] ? D-10:D )) && continue
        Rests[V]=$(( $[F=$[G=$[A-F]-B]<0] ? G+10:G ))
        done

Sweet="${Sweet//[[:digit:]]/-}"

        for Dream in ${Rests[@]}; do
        Sweet="${Sweet/-/${Dream}}"
        done

[[ $Ext != ten ]] && echo "${Sweet}" > ${1%.*}.ten && return 0
Encode 0 ${Sweet%%\ *} > ${1%.*}.bak && echo $'\n'"${Sweet#*\ }" >> ${1%.*}.bak

}


Paver $@

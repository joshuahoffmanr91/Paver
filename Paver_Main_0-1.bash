#!/bin/bash
	
Main () {

shopt -s extglob

	for Source in ${@-$0}; do
	O_[0]="$(cat $Source)" && mapfile -O 1 O_ <<<"${O_[@]}"
	mapfile M_ <<<"${O_[0]//$'\t'/    }"
	N="${M_[@]//$'\n'/\ $'\n'\ }" && S_=(${N}) && A_=(${S_[@]//?()/\\})
	eval eval declare -A B_[\\\${A_[{0..${#A_[@]}}]%\\}]+=\"\\\ $[A++]\"
	eval eval C_[\\\${#M_[{${#M_[@]}..0}]}]+=\"\\\ \\\${M_[A--]}\"
	D_=(${!C_[@]})

	Paver () {
	
		while (( ++A+1 < ${#M_[@]} )); do
		[[ "${M_[A]//[[:alpha:]|[:space:]]}" = "(){" ]] && {
		Stack[++E-F]+=\ $A ; } || { [[ "${M_[A]//[[:space:]]}" = "}" ]] && {
	 	Morter[++F]="${M_[@]:$[D=${Stack[E-F]##*\ }]:$[A-D+1]}"
		Harden=${M_[A]//[!0-9|[:space:]]}
		Soften=$(cksum <<<"${Morter[F]}") ;} || continue
		[[ $Soften != ${Harden#*} ]] && {

			while (( D++ < A )); do
			unset Padds
			eval declare Padds[{${D_[-1]}..${#M_[D]}}]=" "
			(( $[O=D-A] == 0 )) && { ((H++)) 
			echo "${M_[A]//[![:blank:]]}"\}"${Padds[@]} #$Soften" 
			} || echo "${M_[D]::-1}${Padds[@]} #$(cksum <<<"${M_[D]}")"
			done

		} ;} || ((I++))
		done
	
	((J=$[H+I]-$[E+F/2]==0)) || return $J
	
	}
	
	Compress () {	

	        for b in ${F_[@]%-}; do
	
	                for c in ${B_[$b-]}; do
	                ! [[ " ${H_[@]} " == *" ${A_[--A-1]} "* ]] &&\
			H_+=("${A_[A-1]}")
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
	
	Slip=(${M_[0]})
	Skip=(${M_[@]:1:${#M_[@]}})
	
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
	
	Stand="${M_[@]:1}"
	eval Runs="\"${Stand//+([0-9|-])/\$\{Leap\[\$\(\(Z++\)\)\]\}}\""
	cat <<<"$Runs" >> ${1%%.*}_$(date +'%s').${1#*.}

	}
	
	Abstract () {
	
	        Encode () {
	
	        unset {A..Z}
	        [[ $1 = P ]] && { read -sp "?:" a
	        } || a="$(cat <<<${@:2})"
	        eval A_+=(\$\'\\\\\\{0..7}{0..7}{0..7}\')
	        B_=(${A_[@]//[\\|\*|[:cntrl:]]/})
	        eval declare -A C_[\${B_[--A]/#/\\\\}]={00..95}
	        eval C_[{95..00}]=${B_[$((--A))]/#/\\}
	        C_+=([$'\t']=96 [$'\n']=99 [' ']=98 [\*]=97 [99]=$'\n' [97]=\* [98]=' ' [96]=$'\t')
	        [[ $1 =~ (F|P) ]] && X=1
	
	                for (( A=${X:=2}-X; A <= ${#a}; A=A+X )); do
			echo -n "${C_["${a:$A:$X}"]}" 
	                done
	
	        }
	
	        Inflation () {

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
	
	unset {A..Z}
	[[ ${Ext:=${1##*.}} != ten ]] &&\
	M_[0]="$(Encode F ${M_[0]})"
	Build=(${M_[@]//?()/\ })
	Minds=($(Inflation ${#Build[@]} $(Encode P)))
	
	        while (( $((V=W++)) < ${#Build[@]} )); do
	        A=${Build[V]} && B=${Minds[V]}
		[[ $Ext = ten ]] && {
		Rests[V]=$(( $[E=$[D=A+B+E]>9] ? D-10:D )) ;} || {
	        Rests[V]=$(( $[F=$[G=$[A-F]-B]<0] ? G+10:G )); }
	        done
	
	Sweet="${Sweet//[[:digit:]]/-}"
	
	        for Dream in ${Rests[@]}; do
	        Sweet="${Sweet/-/${Dream}}"
	        done
	
	[[ $Ext != ten ]] && echo "${Sweet}" > ${1%.*}.ten && return 0
	Encode 0 ${Sweet%%\ *} > ${1%.*}.bak && echo $'\n'"${Sweet#*\ }" >> ${1%.*}.bak
	
	}

Paver $Source && echo $?
done

}

Main $@

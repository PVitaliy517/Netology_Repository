#!/bin/bash

numbercontrol  () {
	if [[ -z "${1##[0-9]*}" ]];
		then  echo 0
	else echo 1
	fi
}


while true; do
num1=1
num2=1

while [[ $num1 -eq 1 ]] || [[ $num2 -eq 1 ]]; do
	echo "Введите  два числа"
	read  n1 n2
	num1=$(numbercontrol $n1)
	num2=$(numbercontrol $n2)
	if [[ $num1 -eq 1 ]] || [[ $num2 -eq 1 ]]; then
		echo  "Ошибка. Введите два положительных числа."
	else 
		num1=0
		num2=0
	fi
done

echo "Введите арефметическое действие"
read aref
case "$aref" in 
	"+") 	resault=$(( $n1+$n2 )) 
		echo "$n1 + $n2 = $resault" ;;
	"-") 	resault=$(( $n1-$n2 ))
		echo "$n1 - $n2 = $resault" ;;
	"*")	resault=$(( $n1*$n2 ))
		echo "$n1 * $n2 = $resault" ;;
	'/')	if [[ $n2 -eq 0 ]]; then 
			echo "Ошибка. Деление на 0"
		else resault=$(( $n1/$n2 ))
		echo "$n1 / $n2 = $resault" 
		fi ;;
esac

echo "Продолжить работу с калькулятором - Y (Да); N (Выход)."
read x
case "$x" in
	("N"|"n")	break ;;
	("Y"|"y") 	continue ;;
	*)  	echo "Вы сделали неправильный выбор. Работа с калкулятором будет завершена принудительно."
		break ;;
esac
done

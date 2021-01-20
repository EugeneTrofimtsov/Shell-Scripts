#!/bin/bash

echo "=========================================================\\
 (A) Add
 (B) Subtract
 (C) Multiply
 (D) Divide
 (E) Modulus
 (F) Exponentiation
 (G) Exit
=========================================================/"

while true
do
	read -p "Enter operation: " op
	if [[ "$op" =~ ^(G|g)$ ]]; then exit;
	elif ! [[ "$op" =~ ^(A|a|B|b|C|c|D|d|E|e|F|f)$ ]]; then echo "Command is unknown!";
	else
		read -p "Enter first number: " x
		read -p "Enter second number: " y
		case $op in
		A|a) echo "$x + $y = $(( y + x ))";;
		B|b) echo "$x - $y = $(( x - y ))";;
		C|c) echo "$x * $y = $(( $x * $y ))";;
		D|d) if [ $y -eq 0 ]; then echo "Error: delimiter by zero"; else echo "$x / $y = $(( $x / $y ))"; fi;;
		E|e) echo "$x % $y = $(( $x % $y ))";;
		F|f) echo "$x ** $y = $(( $x ** $y ))";;
		*) echo "Command is unknown!"
		esac;
	fi
done
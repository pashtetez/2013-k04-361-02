#!/bin/bash

echo "Программа, которая выводит UID пользователя и его группы"
echo "Разработчик: Волчков Павел"

while [ true ]
do
echo "Начать выполнение?(y/n)"
read ex
       

 case $ex in
  n )
     echo "Программа завершена"
     exit 0
  ;;
  y )
   while [ $ex = y ]; do
echo -n "Введите имя пользователя "
read c
  
	grep $c /etc/passwd > /dev/null  
	while [ $? -ne 0 ]; do
	echo -n "Пользователь не существует! Еще раз?(y/n) "
       		read ex

	case $ex in
        	y )
          		echo -n "Введите имя пользователя ";
          		read c	
			grep $c /etc/passwd > /dev/null 
        	;;
        	n )
        		exit 0
        	;;
        	esac
	done  
echo -n "UID:";
id -u $c
echo -n "Группы пользователя:";
groups $c
exit 0 
done
esac

done
exit 0

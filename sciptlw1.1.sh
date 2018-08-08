#!/bin/bash 
echo "PREGUIÇODO DA HOSPEDAGEM."
   echo "------------------------------------------"
   echo "    Menu          "
   echo "------------------------------------------"
   echo
   echo "[ 1 ] Atualizar o php.ini"
   echo "[ 2 ] Atualizar o .htaccess"
   echo "[ 3 ] Sair"
   echo -n "Qual a opcao desejada ? "
   read opcao

## Antes do Script começar vamos dar permissão 77 no diretorio TMP
chmod 777 /home/$USER/tmp

if [ $opcao -eq 1 ]; then

arquivo="php.ini" 
arquivo_old="php.ini_old" 

echo -e '\033[33;1m ====================================== Bem Vindo =================================== \033[m' 
echo -e '\033[33;1m Esse script foi criado a fim de ótimizar o tempo dos analistas em hospedagens Linux \033[m'
echo -e '\033[40;31m                     By: weslley.silva Hospedagem e Email. \033[m'
echo -e '\033[33;1m ==================================================================================== \033[m' 
echo " "
echo -e "                              ~#~#~#~#~# Atualizando PHP.INI #~#~#~#~#~#~#                             "
 
        if [ -e $arquivo\_old ]; then 
                read -p "Opss.. Percebi que o $arquivo_old já existe por favor de outro nome para ele: " newname 
                echo "Estou movendo o $arquivo para $newname" 
                mv $arquivo $newname 
		echo "Agora estou criando um novo $arquivo"	
		touch $arquivo

		cp /etc/php.ini ~/
		echo "Agora estou atualizando todos as diretivas do php.ini... "

                        sed -i '300s/30/90/' ~/php.ini
                echo -e "max_execution_time...	('\033[40;32;1m OK \033[m')"
                        sleep 1
                        sed -i '301s/60/90/' ~/php.ini
                echo -e "max_input_time...	('\033[40;32;1m OK \033[m')"
                        sleep 1
                        sed -i '303s/32M/512M/' ~/php.ini
                echo -e "memory_limit...         ('\033[40;32;1m OK \033[m')"
                        sleep 1
                        $(sed -i 954d ~/php.ini)
                echo -e "session.save_path...	('\033[40;32;1m OK \033[m')"
                        echo "session.save_path = /home/$USER/tmp" >> ~/php.ini
                        sleep 1

                        echo "A atualização ocorreu com SUCESSO!!!"

	elif [ -e "$arquivo" ]; then 
        	echo "O php.ini já existe, estou fazendo um backup dele... "; 
        	sleep 2 

                mv $arquivo $arquivo\_old
                echo "Pegando o php.ini atualizado..."
                echo "PROCESSANDO..."
                sleep 1

                cp /etc/php.ini ~/

		echo "Agora estou atualizando todos as diretivas do php.ini... "

                        sed -i '300s/30/90/' ~/php.ini
                echo -e "max_execution_time...	('\033[40;32;1m OK \033[m')"
                        sleep 1
                        sed -i '301s/60/90/' ~/php.ini
                echo -e "max_input_time...	('\033[40;32;1m OK \033[m')"
                        sleep 1
                        sed -i '303s/32M/512M/' ~/php.ini
                echo -e "memory_limit...         ('\033[40;32;1m OK \033[m')"
                        sleep 1
                        $(sed -i 954d ~/php.ini)
                echo -e "session.save_path...	('\033[40;32;1m OK \033[m')"
                        echo "session.save_path = /home/$USER/tmp" >> ~/php.ini
                        sleep 1

                        echo "A atualização ocorreu com SUCESSO!!!"

	else

		echo -e '\033[40;31m O php.ini não existe... \033[m'

        	echo " "
        	read -p "Mais mesmo assim deseja cria-lo em sua nova versão? [S/n]: " yesorno

       	if [ $yesorno = S ] || [ $yesorno = s ] || [ $yesorno = sim ] || [ $yesorno == SIM ] ; then
                echo "Estou copiando o arquivo..."
                cp /etc/php.ini .
                sleep 1
                echo "Arquivo copiado com sucesso!!!."
		echo " "
		sleep 1
                echo "Agora estou atualizando todos as diretivas do php.ini... "
                echo -e "max_execution_time...	( '\033[40;32;1m OK \033[m' )"
                        sed -i '300s/30/90/' ~/php.ini
                        sleep 1
                echo -e "max_input_time...	( '\033[40;32;1m OK \033[m' )"
                        sed -i '301s/60/90/' ~/php.ini
                        sleep 1
                echo -e "memory_limit...         ( '\033[40;32;1m OK \033[m' )"
                        sed -i '303s/32M/512M/' ~/php.ini
                        sleep 1
                echo -e "session.save_path...	( '\033[40;32;1m OK \033[m' )"
                        $(sed -i 954d ~/php.ini)
                        echo "session.save_path = /home/$USER/tmp" >> ~/php.ini
                        sleep 1

                        echo "A atualização ocorreu com SUCESSO!!!"
        	else

                echo "Tudo bem, estou finalizando o script..."
                sleep 1
	fi

                                                                                              
fi
fi

if [ $opcao -eq 2 ]; then

arquivo=".htaccess"
arquivo_old=".htaccess_old"

	if [ -e $arquivo\_old ]; then
		read -p "Opss.. Percebi que o $arquivo_old já existe por favor de outro nome para ele: " newname
                echo "Estou movendo o $arquivo para $newname" 
                mv $arquivo $newname
		echo "Agora estou criando um novo..."
		sleep 1
		touch $arquivo

	elif [ -e $arquivo ]; then
			
		echo "O $arquivo já existe, estou fazendo um backup dele... ";
                sleep 2
                mv $arquivo $arquivo\_old
                echo "PROCESSANDO..."
                sleep 1
		echo "Agora estou criando um novo..."
		sleep 1
		touch $arquivo

	else
		
		echo -e '\033[40;31m O $arquivo não existe... \033[m'
                echo " "
                read -p "Mais mesmo assim deseja cria-lo? [S/n]: " yesorno

        if [ $yesorno = S ] || [ $yesorno = s ] || [ $yesorno = sim ] || [ $yesorno == SIM ] ; then
                echo "Estou criando o $arquivo"
                touch $arquivo
                sleep 1
                echo "Arquivo criado com sucesso!!!."
	fi
	
	echo "Agora vamos definir uma versão do php ao seu $arquivo: (Selecione uma abaixo)"
		
fi
fi


#!/bin/bash



echo "Comecando a criacao dos dirs publico adm ven sec..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "terminado a criação dos dirs"



echo "Comecando a criacao dos Grupos ADM VEN SEC..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC



echo "terminado a criação dos Grupos."




echo "Comecando a criacao dos usuarios..."

useradd carlos -m -c "Carlos ADM" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_ADM
useradd maria -m -c "Maria  ADM" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_ADM
useradd joao -m -c "Joao   ADM" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_ADM

useradd debora -m -c "Debora VENDAS" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_VEN
useradd sebastiana -m -c "Sebastiana VENDAS" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_VEN
useradd roberto -m -c "Roberto VENDAS" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_VEN

useradd josefina -m -c "Josefina  SECRETARIADO" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_SEC
useradd amanda -m -c "Amanda  SECRETARIADO" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_SEC
useradd rogerio -m -c "Rogerio  SECRETARIADO" -s /bin/bash -p $(openssl passwd -1 Enet) -G GRP_SEC

echo "Terminado a criacao dos usuarios."



echo "mudando o grupo dos diretorios sem alterar o dono root..."

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

echo "finalizado a alteração do grupo dos diretorios."




echo "Inserindo usuarios em seus grupos de seus departamentos..."

usermod -G GRP_ADM carlos
usermod -G GRP_ADM maria
usermod -G GRP_ADM joao

echo "ADM criado"

usermod -G GRP_VEN debora
usermod -G GRP_VEN sebastiana
usermod -G GRP_VEN roberto

echo "Venda criado"

usermod -G GRP_SEC josefina
usermod -G GRP_SEC amanda
usermod -G GRP_SEC rogerio

echo "SEC criado"

echo "Finalizado a insercao de usu nos grupos."




echo "Criando as regras de acesso ao dir publico..."

chmod 777 /publico


echo "Finalizado a regra de acesso ao dir publico."



echo "Configurando a restricao de acesso as pastas"



chmod 770 /adm
chmod 770 /ven
chmod 770 /sec


echo "finalizado a criacao das restricoes."




echo "Finalizado..."

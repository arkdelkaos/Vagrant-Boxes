# Vagrant-Boxes
Configuraciones de entorno de trabajo. Actualmente solo para virtualbox.

### Ubuntu 14
```
git clone https://github.com/arkdelkaos/Vagrant-Boxes.git Vagrant-Boxes
cd Vagrant-Boxes/Ubuntu14/
vagrant up
```
La parte de puppet durante la instalación es lentísima.<br> 
Con o sin verbose+debug, tiende a resular peligrosamente lenta, ya que al cabo de unos minutos el usuario puede pensar que se ha colgado el proceso (sobre todo durante la instalación de node).<br>
No he encontrado solución al probema: Ármate de paciencia, y espera ;)

#####IP y Puertos:
192.168.7.77<br>
-- 27017: Mongodb<br>
-- 7777: dev<br>
-- 3333: pro<br>

#####Puppet
* git
* curl  
* g++  
* mongodb  
* n  
  * node 5.1.1
* express  
* yo  
  * generator-angular  
  * generator-karma  
* nodemon  
* bower  
* gulp  
* grunt-cli  
* ruby-dev  
  * compass

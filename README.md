# Vagrant-Boxes
Configuraciones de entorno de trabajo. Actualmente solo para virtualbox.

### Pre-Install
* Mac  
```
brew install Caskroom/cask/virtualbox Caskroom/cask/vagrant
````
* Windows  
```
choco install vagrant virtualbox
```

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
192.168.7.77  
* 7777: dev
* 3333: pro

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

# Vagrant-Boxes
Configuraciones de entorno de trabajo. Actualmente solo para virtualbox.

### Pre-Install
* Mac  
```
brew install Caskroom/cask/virtualbox Caskroom/cask/vagrant
````
* Windows  (Recomiendo encarecidamente usar CMDER)
```
choco install vagrant virtualbox
```

### Ubuntu 14
```
git clone https://github.com/arkdelkaos/Vagrant-Boxes.git Vagrant-Boxes
cd Vagrant-Boxes/Ubuntu14/
vagrant up
```

#####IP y Puertos:
192.168.7.77  (7700..7777)
* 7777: dev
* 7733: pro
* 7722: ssh

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

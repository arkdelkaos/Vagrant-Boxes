# Vagrant-Boxes
Configuraciones de entorno de trabajo. Actualmente solo para virtualbox.

### Ubuntu 14
```
git clone https://github.com/arkdelkaos/Vagrant-Boxes.git Vagrant-Boxes
cd Vagrant-Boxes/Ubuntu14/
vagrant up
```
La parte de puppet durante la instalación es lentísima. Con o sin verbose+debug, tiende a resular peligrosamente lenta, ya que al cabo de unos minutos el usuario puede pensar que se ha colgado el proceso (sobre todo durante la instalación de node). No he encontrado solución al probema: Ármate de paciencia, y espera ;)

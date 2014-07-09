/home/vagrant/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: vagrant
    - group: vagrant
    - mode: 644

make:
  pkg:
    - installed

curl:
  pkg:
    - installed

git:
  pkg:
    - installed

ncurses-devel:
  pkg:
    - installed

kerl:
  cmd.run:
    - name: curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
    - cwd: /usr/local/bin
    - stateful: True
    - unless: ls /usr/local/bin/kerl
  file.managed:
    - name: /usr/local/bin/kerl
    - mode: 755
  require:
    - pkg: curl

build-r16b03:
  cmd.run:
    - name: /usr/local/bin/kerl build R16B03 r16b03
    - user: vagrant
    - group: vagrant
    - unless: grep r16b03 /home/vagrant/.kerl/otp_builds

install-r16b03:
  cmd.run:
    - name: /usr/local/bin/kerl install r16b03 /home/vagrant/.kerl/installs/r16b03
    - user: vagrant
    - group: vagrant
    - unless: grep r16b03 /home/vagrant/.kerl/otp_installations

build-r17b01:
  cmd.run:
    - name: /usr/local/bin/kerl build 17.1 r17b01
    - user: vagrant
    - group: vagrant
    - unless: grep r17b01 /home/vagrant/.kerl/otp_builds

install-r17b01:
  cmd.run:
    - name: /usr/local/bin/kerl install r17b01 /home/vagrant/.kerl/installs/r17b01
    - user: vagrant
    - group: vagrant
    - unless: grep r17b01 /home/vagrant/.kerl/otp_installations
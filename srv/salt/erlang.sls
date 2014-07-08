/home/vagrant/.bash_aliases:
  file.managed:
    - source: salt://bash_aliases
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

kerl-completion:
  cmd.run:
    - name: curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/bash_completion/kerl
    - cwd: /etc/bash_completion.d
    - unless: ls /etc/bash_completion.d/kerl
  require:
    - pkg: curl

build-r17.1:
  cmd.run:
    - name: /usr/local/bin/kerl build 17.1 r17.1
    - user: vagrant
    - group: vagrant
    - unless: grep r17.1 /home/vagrant/.kerl/otp_builds

install-r17.1:
  cmd.run:
    - name: /usr/local/bin/kerl install r17.1 /home/vagrant/.kerl/installs/17.1
    - user: vagrant
    - group: vagrant
    - unless: grep r17.1 /home/vagrant/.kerl/otp_installations
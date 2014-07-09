# Vagrant's Erlang sandbox

Creates a virtual environment for erlang development with [Vagrant](http://www.vagrantup.com) and [Salt](http://docs.saltstack.com)

## What in a box?

  - CentOS 6.5
  - Curl
  - Git
  - [Kerl](https://github.com/spawngrid/kerl) _(with kerl's bash completion)_
  - Erlang R16B02 _(built and activated)_
  - Erlang 17.1

## Prerequisite

Salt plugin must be installed in Vagrant

```bash
vagrant plugin install vagrant-salt
```

## Installation

```bash
git clone git@github.com:eiri/vagrant-erlang-sandbox.git
cd vagrant-erlang-sandbox
vagrant up
```
_it'll take a **while**, but after it's done_
```bash
vagrant ssh
vagrant@precise64:~$ erl -version
Erlang (SMP,ASYNC_THREADS) (BEAM) emulator version 5.10.3
```

## Switching to different erlang release

```bash
$ kerl_deactivate
$ kerl list installations
r16b03 /home/vagrant/.kerl/installs/r16b03
r17b01 /home/vagrant/.kerl/installs/r17b01
$ . /home/vagrant/.kerl/installs/r17b01/activate
erl -version
Erlang (ASYNC_THREADS,HIPE) (BEAM) emulator version 6.1
```

## Testing Salt's highstate

Run `sudo salt-call state.highstate` from the virtual box.

## ToDo

  - Install [rebar](https://github.com/basho/rebar) in /usr/local/bin
  - Take a look at [Agner](https://github.com/agner/agner)
# Vagrant's Erlang sandbox

Creates a virtual environment for erlang development with [Vagrant](http://www.vagrantup.com) and [Salt](http://docs.saltstack.com)

## What in a box?

  - Ubuntu 12.04
  - Curl
  - Git
  - [Kerl](https://github.com/spawngrid/kerl) _(with kerl's bash completion)_
  - Erlang R16B02 _(built and activated)_

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
_it'll take a while, but after it's done_
```bash
vagrant ssh
vagrant@precise64:~$ erl -version
Erlang (SMP,ASYNC_THREADS) (BEAM) emulator version 5.10.3
```

## Changes

Take it, fork it, it's free as  birds.
If you'll need to add something to the state tree, handy way to test changes after is to run `sudo salt-call state.highstate` from the virtual box.

## ToDo

  - Install [rebar](https://github.com/basho/rebar) in /usr/local/bin
  - Take a look at [Agner](https://github.com/agner/agner)
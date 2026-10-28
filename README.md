<p align="center">
  <a href="https://github.com/altruby/picoruby-etc">
    <img src="daemon.png" width="200" height="200" border="0" alt="picoruby-etc">
  </a>
</p>
<p align="center">
  <strong>picoruby-etc</strong>
</p>

## About

[picoruby](https://picoruby.org/) + getpwent(3) = picoruby-etc.

This project combines an implementation of 
ruby that can run on a single-chip microcontroller 
and [getpwent(3)](https://man.freebsd.org/getpwent)
from the FreeBSD project and other POSIX-based systems. 
Although [picoruby](https://picoruby.org/) markets itself 
towards embedded devices it also happens to run exceptionally
well on POSIX systems too. It is more or less straight forward 
to embed picoruby's bytecode into a C program.

## Install

##### make

The next few lines will build your own copy 
of the picoruby executable. The executable
is linked against picoruby-jail and when it
is run it automatically has access to the
picoruby-jail classes, modules and methods. 
This can be surprising compared to mainline
CRuby where there is a single copy of the 
executable that is built once on install: 

    $ git clone --recurse-submodules https://github.com/picoruby/picoruby picoruby
    $ git clone https://github.com/altruby/picoruby-jail
    $ cd picoruby-jail
    $ make build
    $ ../picoruby/build/picoruby-jail/bin/picoruby -e 'p Jail.all'

##### build_config.rb

The steps:

```sh
mkdir myapp
touch build_config.rb
cd ../picoruby
MRUBY_CONFIG=../myapp/build_config.rb rake
```

The configuration (`build_config.rb`):

```ruby
MRuby::Build.new("app") do |conf|
  conf.toolchain
  conf.gembox "default"
  conf.gem github: "altruby/picoruby-jail", branch: "main"
end
```

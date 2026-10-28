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
is linked against picoruby-etc and when it
is run it automatically has access to the
picoruby-etc classes, modules and methods. 
This can be surprising compared to mainline
CRuby where there is a single copy of the 
executable that is built once on install: 

    $ git clone --recurse-submodules https://github.com/picoruby/picoruby picoruby
    $ git clone https://github.com/altruby/picoruby-etc
    $ cd picoruby-etc
    $ make build
    $ ../picoruby/build/picoruby-etc/bin/picoruby -e 'p Jail.all'

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
  conf.gem github: "altruby/picoruby-etc", branch: "main"
end
```

## Quick start

##### Enumerable

The Etc module extends Enumerable into itself
and yields instances of Etc::Row. A row represents
an instance of `struct passwd` that is returned
by the [getpwent(3)](https://man.freebsd.org/getpwent) 
family of functions. This  information comes directly 
from the password database described by 
[passwd(5)](https://man.freebsd.org/passwd?sektion=5).

```ruby
##
# Find a user
Etc.find { it.name == "robert" }

##
# Select users
Etc.select { it.shell == "/bin/sh" }

##
# Enumerate users
Etc.each do 
  print "name  ", "\t", it.name,  "\n"
  print "home  ", "\t", it.home,  "\n"
  print "shell ", "\t", it.shell, "\n"
end
```

## Problems

It's not thread safe.  
Planned for the future.

## License

MIT. <br>
See [LICENSE]() for details.

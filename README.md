# Jenkins Cron

In larger projects you may end up with a hole bunch of tasks that needs
to be executed either on a timed schedule or depend on each other. You
could of course implement that with the help of cron.  Nevertheless you
still need to provide your one reporting facility and realizing
dependent job execution would again reqiure additional work. But there
is help. Jenkins (a CI-System) is very good in running stuff depending
on different events and keep track of a large set of statistics at the
same time. So, why not just use it to run something else than automated
tests? This gem gonna help to use Jenkins in that way.

## Install

## Example

## Usage

## Developer Instructions

The dependencies for the gem and for developing the gem are managed by Bundler.

    gem install bundler
    git clone http://github.com/railsbros_dirk/jenkins_cron.git
    bundle install

The test suite is run with:

    rake

This runs the cucumber features and the specs.

## Contributors

* Dirk Breuer

## License

(The MIT License)

Copyright (c) 2011 Dirk Breuer, dirk@galaxycats.com

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

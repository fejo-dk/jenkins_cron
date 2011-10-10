# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jenkins_cron/version"

Gem::Specification.new do |s|
  s.name        = "jenkins_cron"
  s.version     = JenkinsCron::VERSION
  s.authors     = ["Dirk Breuer"]
  s.email       = ["dirk@galaxycats.com"]
  s.homepage    = "http://github.com/railsbros-dirk/jenkins_cron"
  s.summary     = %q{Jenkins-Cron let you define jobs that would be run with cron normally to be performed via Jenkins.}
  s.description = %q{In larger projects you may end up with a hole bunch of tasks that needs to be executed either on a
                     timed schedule or depend on each other. You could of course implement that with the help of cron.
                     Nevertheless you still need to provide your one reporting facility and realizing dependent job execution
                     would again reqiure additional work. But there is help. Jenkins (a CI-System) is very good in running stuff
                     depending on different events and keep track of a large set of statistics at the same time. So, why not just
                     use it to run something else than automated tests? This gem gonna help to use Jenkins in that way.}

  s.rubyforge_project = "jenkins_cron"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("jenkins", ["~> 0.6.5"])
  s.add_runtime_dependency("whenever", ["~> 0.7.0"])
  s.add_runtime_dependency("activesupport", [">= 2.3"])

  s.add_development_dependency("rake", ["~> 0.9.2"])
  s.add_development_dependency("rspec", ["~> 2.6.0"])
  s.add_development_dependency("awesome_print")
end

# Overview

## Tooling/Ecosystem
1. `rvm` - binary that manages different ruby installations on host (like opam)
2. `gem` - binary that manages ruby packages on host (like pip)
3. `bundle` - binary that manages a "set of gems" for a specific ruby application (like pip & requirements.txt)
4. `rake` - binary that is similar to make, used for task automation with a DSL (DB migrations, ..etc)
5. `rspec`- binary for test automation/creation framework 
6. `sidekiq` - allows for async jobs to be integrted closely with ruby/rails (redis used as queue)
7. `rails` - binary/gem that can generate the "boilerplate" code + runtime for MVC applications + common rake tasks
8. `rack` - API/Standard that decouples web server and application/business logic code for ruby frameworks so that different web servers (puma, phusion) similar to python's (WSGI) 

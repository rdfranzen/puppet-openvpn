require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'

require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'

PuppetLint.configuration.send("disable_80chars")

task :integration => [:syntax, :lint, :metadata_lint, :spec]

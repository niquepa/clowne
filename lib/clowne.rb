# frozen_string_literal: true

require 'clowne/version'
require 'clowne/dsl'
require 'clowne/configuration'
require 'clowne/cloner'
require 'clowne/plan'
require 'clowne/planner'

require 'clowne/declarations/exclude_association'
require 'clowne/declarations/finalize'
require 'clowne/declarations/include_all'
require 'clowne/declarations/include_association'
require 'clowne/declarations/nullify'
require 'clowne/declarations/trait'

require 'clowne/base_adapter/finalize'
require 'clowne/base_adapter/nullify'
require 'clowne/base_adapter/adapter'

if defined?(ActiveRecord)
  require 'clowne/active_record/association'
  require 'clowne/active_record/adapter'
end
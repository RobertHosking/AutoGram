# Sidekiq defers scheduling to other, better suited gems.
# If you want to run a job regularly, here's an example
# of using the 'clockwork' gem to push jobs to Sidekiq
# regularly.

# require boot & environment for a Rails app
# require_relative "../config/boot"
# require_relative "../config/environment"
require_relative "config/boot"
require_relative "config/environment"
require "clockwork"


module Clockwork
  every(1.day, 'Run InstaPy on all accounts') { InstaPyScriptWorker.queue_accounts }
end
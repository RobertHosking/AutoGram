# Job that handles running the InstaPy Python Script
class InstaPyScriptWorker
  include Sidekiq::Worker
  def perform( username, password, tags, comments, comment_percentage, amount )
      #username = account.username
      #password = account.password
      #tags = account.tags
      #comments = account.comments
      #comment_percentage = account.comment_percentage
      #amount = account.amount
      logger.info "Settings recieved..."
      path_to_script = "public/InstaPy/single_serve.py"
      command = "python #{path_to_script} #{username} #{Shellwords.escape(password)} '#{tags}' '#{comments}' #{comment_percentage} #{amount}"
          logger.debug "Here's some info: #{hash.inspect}"
logger.info command
      command = `#{command}`
      p command
  end
  
  def self.queue_accounts
    accounts = Account.all
    accounts.each do |account|
        InstaPyScriptWorker.perform_async(account.username, account.password, account.tags, account.comments, account.comment_percentage, account.amount)
    end
  end
  
end

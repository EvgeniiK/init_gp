require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '5 0 * * *' do
  ParseProducts.perform
end

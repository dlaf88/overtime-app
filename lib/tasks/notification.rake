namespace :notification do
  desc "Sends an SMS to employees"
  task sms: :environment do
  	puts "Im in a rake task."
  end

end

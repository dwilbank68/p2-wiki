desc "Checks all users for expired accounts. Changes them to free users."
task :clean_expired_accounts => :environment do
  expired_users = User.where("account_expiration < ?", DateTime.now)
  expired_users.map do |user|
    user.subscribed = false
    user.account_activation = nil
    user.account_expiration = nil
    user.save
    user.wikis.each {|wiki| wiki.update(private:false)}
  end

end


task :testrake do
  puts "rake works #{DateTime.now}"
end
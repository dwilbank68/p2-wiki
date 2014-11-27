set :output, "#{path}/whenever.log"

every 60.minute do
   rake "testrake"
end

every 1.day, :at => '3:18 pm' do
   rake "clean_expired_accounts"
end
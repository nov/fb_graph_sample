namespace :heroku do
  namespace :config do
    task :facebook do
      puts "Reading config/facebook.yml and sending config vars to Heroku..."
      CONFIG = YAML.load_file('config/facebook.yml')['production'] rescue {}
      command = "heroku config:add"
      CONFIG.each {|key, val| command << " #{key}=#{val} " if val }
      system command
    end
  end
end
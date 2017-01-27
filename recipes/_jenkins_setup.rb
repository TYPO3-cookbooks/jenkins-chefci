jenkins_command 'safe-restart' do
  action :nothing
  # restart Jenkins, if Java is updated
  subscribes :execute, 'log[jdk-version-changed]', :delayed
end

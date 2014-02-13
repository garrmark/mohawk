$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'
require 'childprocess'
require 'mohawk'

World(Mohawk::Navigation)

require_rel 'screens'

Mohawk::Navigation.routes = {
  :default => [
    [MainScreen, :about],
    [AboutScreen, :close],
    [MainScreen, :data_entry_form_button],
    [DataEntryForm]
  ]  
}

AfterConfiguration do |config|
  Mohawk.default_adapter = (ENV['MOHAWK_ADAPTER'] == 'uia' && Mohawk::Adapters::UiaAdapter) || Mohawk::Adapters::RAutomationAdapter
  ENV['MOHAWK_ADAPTER']
end

Before('~@wpf') do
  Mohawk.app_path = 'features/support/WindowsForms.exe'
  Mohawk.start
end

Before('@wpf') do
  Mohawk.app_path = 'features/support/wpf_app_exe/TelerikWpfApp.exe'
  Mohawk.start
end

After do
  Mohawk.stop
end

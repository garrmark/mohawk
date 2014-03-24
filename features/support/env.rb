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
    [WpfGrid, :wpf],
    [DataEntryForm]
  ]  
}

AfterConfiguration do |config|
  Mohawk.default_adapter = Mohawk::Adapters::UiaAdapter
  ENV['MOHAWK_ADAPTER'] = 'uia'
end

Before('~@wpf', '~@telerik') do
  Mohawk.app_path = 'features/support/WindowsForms.exe'
  Mohawk.start
end

Before('@wpf') do
  Mohawk.app_path = 'features/support/wpf-app/WpfApplication.exe'
  Mohawk.start
end

Before('@telerik') do
  Mohawk.app_path = 'features/support/telerik-app/TelerikWpfApp.exe'
  Mohawk.start
end

After do
  Mohawk.stop
end

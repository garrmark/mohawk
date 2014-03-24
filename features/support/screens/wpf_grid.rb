class WpfGrid
  include Mohawk
  window(:title => /MainWindow/)

  table(:parts, id: 'dataGrid')
end
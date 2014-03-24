class MessageBox
  include Mohawk
  window(:title => /Selected Part/)

  text(:part, name: /Selected Part: .*/)
end
When /^we select the WPF grid row with index "(.*?)"$/ do |row_index|
  on(WpfGrid).parts = row_index.to_i
end

Then /^the WPF grid row with index "(.*?)" should (not )?be selected$/ do |which_row, to_not_be|
  should_or_should_not = (to_not_be && :should_not) || :should
  on(WpfGrid).parts[which_row.to_i].send(should_or_should_not, be_selected)
end

When(/^we select the WPF grid row with the value "([^"]*)"$/) do |row_value|
  on(WpfGrid).parts = row_value
end

When(/^we (select|clear) the WPF grid row with the following information:$/) do |select_or_clear, table|
  on(WpfGrid).send("#{select_or_clear}_parts", table.hashes.first)
end

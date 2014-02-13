When /^we select the Telerik grid row with index "(.*?)"$/ do |row_index|
  on(TelerikWpfGrid).parts = row_index.to_i
end

Then /^the Telerik grid row with index "(.*?)" should (not )?be selected$/ do |which_row, to_not_be|
  should_or_should_not = (to_not_be && :should_not) || :should
  on(TelerikWpfGrid).parts[which_row.to_i].send(should_or_should_not, be_selected)
end

World(KnowsTheUserInterface)

Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose an item from the menu$/) do
  page.first('.menu-items').click;
end

Then(/^it should appear in the OrderList$/) do
  sleep(1) # to allows time for Ajax calls. (crude).
  expect(order_list.orders.count).to eq 1
end

Then(/^I should see my order(?:|s) on my receipt$/) do
  expect(page.find('#receipt-container')).to have_content order_list.orders.sample.name
end

When(/^I enter a payment$/) do
  enter_payment_of_value 20.0
end

Then(/^I should see the payment on my receipt$/) do
  expect(payment_has_been_made?).to eq true
end


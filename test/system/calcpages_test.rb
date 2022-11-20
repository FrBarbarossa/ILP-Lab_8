require "application_system_test_case"

class CalcpagesTest < ApplicationSystemTestCase
  test "viewind the form" do
    visit root_url
    page.assert_selector "label", text: "From 1 to N:"
  end

  test "form works" do
    # visit root_url
    # fill_in "number", with: "10"
    # click_on "Find Palindromes"
    get :index, number:'100'
    # assert_select "div#result" do
    #   assert_select "table" do |elem|
    #     elements.each do |body|
    #       body.each do |th|
    #         th.each do |td|
    #           assert_select td, "1", "!!!"
    #         end
    #       end
    #     end
    #   end
    # end
    assert_select "result" do
      assert_select "table", /.+/  # Not empty
    end
    assert_selector "result", {:count=>1}, "Wrong title or more than one title element"
    # assert_equal "1", @response.body.result.table.tbody
    # assert_select 'div#result',
  end

  # test "ajax request" do
  #   number = 10
  #   get "http://127.0.0.1:3000/palindromes.json/?number=10", xhr: true
  
  #   assert_equal "[[1,1],[2,4],[3,9]]", @response.value
  #   assert_equal "Array", @response.type
  # end
  # test "visiting the index" do
  #   visit calcpages_url
  #
  #   assert_selector "h1", text: "Calcpage"
  # end
end

require_relative 'spec_helper'
require_relative 'rails_helper'
require 'selenium-webdriver'

RSpec.describe PalindromesController do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'http://localhost:3000/'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  describe "get index page" do
    context "check index page by root" do
      it 'has code 200' do
        @driver.get @base_url
        expect(@driver.current_url).to eq('http://localhost:3000/')
        
      end
    end
  end
end

RSpec.describe PalindromesController, type: :request do
  describe "get index page" do
    context "check index page by root" do
      it 'has code 200' do
        get 'http://localhost:3000/'
        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
      end
    end
  end
end

RSpec.describe PalindromesController, type: :controller do
  describe "check json get" do
    context "correct number requested" do
      render_views

      it 'has code 200' do
        get :index, :params => {:format => :json, :number => -100 }
        expect(response.status).to eq(200)
      end
      it 'returns correct json' do
        get :index, :params => {:format => :json, :number => 100 }
        expect(JSON.parse(response.body)["value"]).to eq([[1, 1], [2, 4], [3, 9], [11, 121], [22, 484]])
      end
    end
  end
end


# # Попытка заполнить форму с помощью AJAX #1
# RSpec.feature "Result table management", :type => :feature do
#   scenario "user pushed correct number" do
#     visit "/"
#     fill_in "number", with: "10"
#     click_button ("Find Palindromes")
#     # expect(page).to have_selector("table tr")
#   end
# end

# # Попытка заполнить форму с помощью AJAX #2
# RSpec.describe "Result table management attempt №2",:js => true, :type => :system do
#   before do
#     driven_by(:rack_test)
#   end

#   it "user pushed correct number" do
#     visit "/"
#     fill_in "number", with: "10"
#     click_button ("Find Palindromes")
#     expect(page).to have_selector("table tr")
#   end
# end
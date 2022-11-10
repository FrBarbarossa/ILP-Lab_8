class PalindromesController < ApplicationController


  def index
  end

  def result
    @result = (1..params[:number].to_i).each.select{|num| if palindrome?(num.to_s) and palindrome?((num**2).to_s) then num end}.map{|i| [i, i**2]}
  end

  private 
  def palindrome?(str)
    str == str.reverse
  end
end

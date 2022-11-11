# frozen_string_literal: true

# Controller for /palindromes
class PalindromesController < ApplicationController
  def index
    @result = count_result(params[:number])
    respond_to do |format|
      format.html
      format.json do
        render json:
          { type: @result.class.to_s, value: @result }
      end
    end
  end

  def result
    @result = count_result(params[:number])
  end

  private

  def palindrome?(str)
    str == str.reverse
  end

  def count_result(number)
    (1..number.to_i).each.select { |num| if palindrome?(num.to_s) && palindrome?((num**2).to_s) then num end }.map { |i| [i, i**2] }
  end
end

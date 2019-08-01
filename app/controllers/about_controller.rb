# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @all_films_count = Film.all.count
  end
end

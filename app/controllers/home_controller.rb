class HomeController < ApplicationController
  def index
    @cats = policy_scope(Cat)
    @cats = Cat.all
    @cat = Cat.new
  end
end

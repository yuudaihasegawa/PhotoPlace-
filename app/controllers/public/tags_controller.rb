class Public::TagsController < ApplicationController

  def new
    @tags = Tag.all
    @tag_new = Tag.new
  end
end

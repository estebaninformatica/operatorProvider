#!/bin/env ruby
# encoding: utf-8
module Api
  module V1
    class CategoryProvidersController < ApplicationController
      
    	def index
    	  @categories = CategoryProvider.all
    	  render json: @categories
    	end
    	
	  end
  end
end
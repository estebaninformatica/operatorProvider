#!/bin/env ruby
# encoding: utf-8
module Api
  module V1
    class ProvidersController < ApplicationController
      
    	def index
    	  @providers = Provider.search(params[:name]).limit(params[:limit]).offset(params[:offset]).select(:id,:name)
    	  render json: @providers, methods: :url
    	end
    	
      def show
        @provider = Provider.find(params[:id])
        render json: @provider, methods: :url
      end
      
      def show_with_operator
        @provider = Provider.find(params[:id])
        render json: @provider.to_json({:include => :operator}), methods: :url
      end

	  end
  end
end
#!/bin/env ruby
# encoding: utf-8
module Api
  module V1
    class ProvidersController < ApplicationController

      before_filter :set_agency, except: [:index]
      
    	def index
    	  @providers = Provider.limit(params[:limit]).offset(params[:offset]).select(:id_prestador,:name)
    	  render json: @providers, methods: :url
    	end
    	
      def show
        render json: @provider, methods: :url
      end
      
      private

      def set_provider
        @provider = Provider.find(params[:id])
      end

	  end
  end
end
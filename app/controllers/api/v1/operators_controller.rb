#!/bin/env ruby
# encoding: utf-8
module Api
  module V1
    class OperatorsController < ApplicationController

    	def index
    	  @operators = Operator.limit(params[:limit]).offset(params[:offset]).select(:id,:name)
    	  render json: @operators, methods: :url
    	end

    	def index_with_providers
    		@operators = Operator.includes(:providers)
    		render json: @operators.to_json({:include => :providers}), methods: :url
    	end

    	def show
    		@operator = Operator.find(params[:id])
        render json: @operator, methods: :url
      end

      def show_with_providers
    		@operator = Operator.includes(:providers).where(:id_ope => params[:id])
    		render json: @operator.to_json({:include => :providers}), methods: :url
      end

		end
  end
end

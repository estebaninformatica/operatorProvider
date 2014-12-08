#!/bin/env ruby
# encoding: utf-8
module Api
  module V1
    class OperatorsController < ApplicationController

    	def index
    	  @operators = Operator.search(params[:name]).limit(params[:limit]).offset(params[:offset])
    	  render json: @operators, methods: :url 
    	end

    	def index_with_providers
    		@operators = Operator.limit(params[:limit]).offset(params[:offset])
    		render json: @operators.to_json({:include => :providers}), methods: :url
    	end

      def index_with_providers_name
        @operators = Operator.limit(params[:limit]).offset(params[:offset]).includes(:providers).select(:id,:name)
        render json: @operators.to_json({:include => [{:providers => {:only => [:id_prestador,:nom_pre,:category_operator]} },]}), methods: :url
      end

    	def show
    		@operator = Operator.includes(:providers).where(:id_ope => params[:id]).first
        render json: @operator.to_json(:include => [:providers,:category_operator,:iva_service], methods: :url)
      end


		end
  end
end

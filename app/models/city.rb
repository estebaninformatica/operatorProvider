#!/bin/env ruby
# encoding: utf-8

class City < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 't_ciudades'
  self.primary_key = :id_ciudad

  def readonly?
    true
  end


  alias_attribute(:name, :nom_ciudad)
  alias_attribute(:id, :id_ciudad)
end
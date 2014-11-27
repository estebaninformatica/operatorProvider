#!/bin/env ruby
# encoding: utf-8

class CategoryProvider < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 'T_Tipo_Prestador'
  self.primary_key = :id_tipo
  has_many :provider, :foreign_key=>'id_tipo', class_name: 'Provider'

  def readonly?
    true
  end

  def nom_tipo
    sanatized(self[:nom_tipo])
  end

  alias_attribute(:name, :nom_tipo)
end
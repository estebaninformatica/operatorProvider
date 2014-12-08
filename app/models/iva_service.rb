#!/bin/env ruby
# encoding: utf-8

class IvaService< ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 'Item_tipo'
  self.primary_key = :tip_item
  has_many :operators, :foreign_key=>'id_cat2', class_name: 'Operator'

  def readonly?
    true
  end

  def nom_tipo
    sanatized(self[:nom_item])
  end

  alias_attribute(:name, :nom_item)
end
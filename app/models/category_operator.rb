#!/bin/env ruby
# encoding: utf-8

class CategoryOperator< ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 'op_cat2'
  self.primary_key = :id_cat
  has_many :operators, :foreign_key=>'id_cat2', class_name: 'Operator'

  def readonly?
    true
  end

  def nom_tipo
    sanatized(self[:nom_cat])
  end

  alias_attribute(:name, :nom_cat)
end
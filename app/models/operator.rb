#!/bin/env ruby
# encoding: utf-8

class Operator < ActiveRecord::Base
  establish_connection :aptour
  self.table_name = 'Operador'
  self.primary_key = :id_ope
  has_many :providers, :foreign_key=>'id_ope', class_name: 'Provider'
  
  def readonly?
    true
  end

  
  def nom_ope
    sanatized(self[:nom_ope])
  end

  # def as_json(options)
  #    super(:only => :id_ope, :methods => [:nom_ope])
  # end
  alias_attribute(:name, :nom_ope)
  alias_attribute(:id, :id_ope)

end
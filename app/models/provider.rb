#!/bin/env ruby
# encoding: utf-8

class Provider < ActiveRecord::Base
  establish_connection :aptour
  self.table_name = 't_prestador'
  self.primary_key = :id_prestador
  belongs_to :operator, :foreign_key=>'id_ope', class_name: 'Operator'

  def readonly?
    true
  end

  def as_json(options)
    super(:only => :id_ope, :methods => [:nom_pre])
  end

  def nom_pre
    sanatized(self[:nom_pre])
  end

  alias_attribute(:name, :nom_pre)
  alias_attribute(:id, :id_prestador)
end
#!/bin/env ruby
# encoding: utf-8

class Operator < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 'Operador'
  self.primary_key = :id_ope
  has_many :providers, :foreign_key=>'id_ope', class_name: 'Provider'
  
  scope :search, ->(term) { where('Operador.nom_ope LIKE ?', "%#{term}%").order("Operador.nom_ope") }

  def url
    api_v1_operator_path(self)
  end

  def readonly?
    true
  end

  def nom_ope
    sanatized(self[:nom_ope])
  end

  def self.pais
    "self[:pais]"
  end
  # def as_json(options)
  #    super(:only => :id_ope, :methods => [:nom_ope])
  # end
  alias_attribute(:name, :nom_ope)
  alias_attribute(:id, :id_ope)

end
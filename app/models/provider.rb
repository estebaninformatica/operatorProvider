#!/bin/env ruby
# encoding: utf-8

class Provider < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 't_prestador'
  self.primary_key = :id_prestador
  #belongs_to :operator, :foreign_key=>'id_ope_pre', class_name: 'Operator'
  has_many  :ope_pro,  :foreign_key=>'id_pre',    class_name: "OpePro"
  has_many  :providers, :through => :ope_pro


  belongs_to :category_provider, :foreign_key=>'id_tipo', class_name: 'CategoryProvider'
  belongs_to :city, :foreign_key=>'id_ciudad', class_name: 'City'

  scope :search, ->(term) { where('t_prestador.nom_pre LIKE ?', "%#{term}%").order("t_prestador.nom_pre") }


  def url
    api_v1_provider_path(self)
  end

  def readonly?
    true
  end

  def nom_pre
    sanatized(self[:nom_pre])
  end

  def city_name
    city.name
  end

  alias_attribute(:name, :nom_pre)
  alias_attribute(:id, :id_prestador)
end
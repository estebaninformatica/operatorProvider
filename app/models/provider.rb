#!/bin/env ruby
# encoding: utf-8

class Provider < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 't_prestador'
  self.primary_key = :id_prestador
  belongs_to :operator, :foreign_key=>'id_ope', class_name: 'Operator'

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

  alias_attribute(:name, :nom_pre)
  alias_attribute(:id, :id_prestador)
end
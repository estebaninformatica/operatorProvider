#!/bin/env ruby
# encoding: utf-8

class OpePro < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  establish_connection :aptour
  self.table_name = 'prestador_x_operador'

  belongs_to :operator,  :foreign_key=>'id_ope', class_name: 'Operator'
  belongs_to :providers, :foreign_key=>'id_pre', class_name: 'Provider'

end
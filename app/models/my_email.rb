# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyEmail < ApplicationRecord
    validates_presence_of :email, message: "Ups.! al parecer olvidaste colocar tu correo.!"
    validates_uniqueness_of :email, message: "Este correo ya fue registrado.!"
    validates_format_of :email, with: Devise::email_regexp, message: "Ingresaste un correo no válido.!"
end

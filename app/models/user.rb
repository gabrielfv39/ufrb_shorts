class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validate :email_domain
  validates :username, presence: true, uniqueness: true
  
  has_many :videos, dependent: :destroy
  has_many :reactions, dependent: :destroy
  
  def reacted_to?(video, type = nil)
    if type
      reactions.exists?(video: video, reaction_type: type)
    else
      reactions.exists?(video: video)
    end
  end
  
  private
  
  def email_domain
    unless email.end_with?('@aluno.ufrb.edu.br')
      errors.add(:email, "must be an institutional email (@aluno.ufrb.edu.br)")
    end
  end
end

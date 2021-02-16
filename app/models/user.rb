class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶー一-龠]+\z/u.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/u.freeze

  validates :password,        format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,  presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday,        presence: true
end

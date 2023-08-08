class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
    validates :email, uniqueness: true,
                      format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "@を含む必要があります" }
    validates :password, length: { minimum: 6 },
                               format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/,
                                         message: "は半角英数字混合で入力してください" }      
  end     
end

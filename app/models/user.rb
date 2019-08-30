class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def create_token
      random_token = SecureRandom.hex(10)
       check=User.find_by_api_secret(random_token)
       if check.present?
          return create_token
       else
        self.update_attributes(:api_secret=> random_token)

       end
   	end

end

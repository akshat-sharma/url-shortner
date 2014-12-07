require "#{ Rails.root }/lib/random_token_generator.rb"

class Url < ActiveRecord::Base
  include RandomTokenGenerator

  before_create :generate_code

  validates :target, presence: true
  validates :target, url: true, allow_blank: true

  private
    def generate_code
      code = token(10)

      unless Url.where(code: token).exists?
        code = token(10)
      end
      self.code = code
    end
end

class Player < ActiveRecord::Base

  validates :username, :email, :firstname, :lastname, :presence => true,  :length => {:minimum => 2}
  validate :valid_email?
  validates_uniqueness_of :username, :email

  before_validation do
    puts "email=\'#{email}\'"
    self.email = self.email.strip
  end

  # Validate email syntax.
  # For now, an email is accepted if it has one @ and no special chars, like space or other stuff
  def valid_email?
    puts "email: '#{email}' split= #{email.split(/@/).size}"
    errors.add(:email,"Must be a valid email") if
         email.split(/@/).size != 2 || email.index(/[\s\!\#\$\%\^\&\*\(\)\+\=\~\`\"\<\>\[\]\:\;\?\/\\\|\{\}]/) != nil
  end


end

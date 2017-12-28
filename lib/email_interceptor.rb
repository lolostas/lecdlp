class EmailInterceptor
  def self.delivering_email(email)
    email.subject = "#{email.to} #{email.subject}"
    email.to = [ 'lolostas@hotmail.com', 'youssef.bsk@gmail.com', 'benoit.54@wanadoo.fr' ]
  end
end

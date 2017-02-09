require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount  = amount
  	@status = "pending"
  end

  def valid?
  	(@sender.valid? && sender.balance > @amount) && @receiver.valid?

  end

  def execute_transaction
  	# binding.pry
	if self.status == "pending" && self.valid?
		@sender.balance -= @amount
	  	@receiver.balance += @amount
	  	@status = "complete"
	elsif self.status == "pending" && self.valid? == false
		# binding.pry
	  	@status = "rejected"
		"Transaction rejected. Please check your account balance."	  	
		
	end
  end

  def reverse_transfer
  	if status == "complete"
  		@sender.balance += @amount
	  	@receiver.balance -= @amount
	  	@status = "reversed"
	end
  end


end

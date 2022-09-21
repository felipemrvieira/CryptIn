class TransitionService
    def initialize(transition)
      @transition = transition
    end
  
    def make_transition
        account = Account.find(@transition.account_id)
        account.balance += @transition.amount
        account.save!

        @transition
    end
end
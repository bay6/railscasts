class User
  module Inviter
    extend ActiveSupport::Concern

    def send_invitation(email)
      UserMailer.invitation(self, email).deliver
      increment! :invitation_count
    end

    def reached_invitation_limit?
      invitation_count.to_i > 5
    end
  end
end

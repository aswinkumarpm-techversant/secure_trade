class WelcomeController < ApplicationController
  def index
    @issuer = Issuer.all.count
    @security = Security.all.count
    @security_type = SecurityType.all.count
    @interest_frequencies = InterestFrequency.all.count
  end
end

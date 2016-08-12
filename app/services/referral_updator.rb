class ReferralUpdator
	def self.update(referral_params)
		response  = make_api_request_with_params(referral_params)
		raise 'Error while updating referral' if response.status != 200
    	response.body
	end

	def self.make_api_request_with_params(referral_params)
	    ::API.connection.put do |req|
	      req.url "/api/v1/referrals/#{referral_params['id']}"
	      req.headers['Content-Type'] = 'application/json'
	      req.body = { referral: referral_params }.to_json
	    end
	end
	private_class_method :make_api_request_with_params
end
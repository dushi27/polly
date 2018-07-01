require 'rails_helper'

class SurveysController < ApplicationController
	describe SurveysController do 
		describe '#index', :type => :controller do 
			it 'should get index for signed in user' do 
				user = FactoryGirl.create(:user)
	   			sign_in(user.email, user.password)
			    get :index
			    expect(response.success?).to match true
			end
		end
	end
end
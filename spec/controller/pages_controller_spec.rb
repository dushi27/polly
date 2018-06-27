require 'rails_helper'

describe PagesController do 
	describe '#index', :type => :controller do 
		it 'gets index' do 
		    get :index
		    response.should render_template :index
		end
	end
end
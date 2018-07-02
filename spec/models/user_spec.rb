describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

	describe 'creates a valid record' do 
	  it { should respond_to(:email) }

	  it "#email returns a string" do
	    expect(@user.email).to match 'user@example.com'
	  end
	end

	describe 'associations' do 
		it {should respond_to(:questions)}
	end

end

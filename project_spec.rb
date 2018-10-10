require_relative 'project'

describe Project do
  before do
    @initial_funding = 100
    @initial_target = 1000
    @project = Project.new("abc", @initial_target, @initial_funding)
  end

  it 'has an initial target funding amount' do
    expect(@project.targetFunding).to eql(@initial_target)
  end

  it 'computes the total funding outstanding as the target funding amount minus the funding amount' do
    expect(@project.targetFunding - @project.funding).to eql(@initial_target - @initial_funding)
  end
  
  it 'increases funds by 25 when funds are added' do
    amount = 25
    @project.addFunds(amount)

    expect(@project.funding).to eql(@initial_funding + amount)
  end
  
  it 'decreases funds by 15 when funds are removed'do
    amount = 15
    @project.removeFunds(amount)

    expect(@project.funding).to eql(@initial_funding - amount)
  end
  
  context "created with a default initial funding" do
    before do
      @initial_target = 1000
      @project = Project.new("abc", @initial_target)
    end

    it 'has a default value of 0 for funding amount' do
      expect(@project.funding).to eql(0)
    end
  end
end
require_relative 'fundrequest'

describe Fundrequest do
  before do
    # $stdout = StringIO.new
    @initial_funding = 100
    @initial_target = 1000
    @project = Project.new("abc", @initial_target, @initial_funding)
    @fundrequest = Fundrequest.new("aaa")

    @fundrequest.add_project(@project)
  end

  it 'increases project funds if a even number is rolled' do
    allow(@fundrequest.die).to receive(:roll).and_return(1)

    @fundrequest.requestFunding

    expect(@fundrequest.projects[0].funding).to eql(@initial_funding + 100)
  end

  it 'decreases project funds if a pair number is rolled' do
    allow(@fundrequest.die).to receive(:roll).and_return(2)

    @fundrequest.requestFunding

    expect(@fundrequest.projects[0].funding).to eql(@initial_funding - 100)
  end
end
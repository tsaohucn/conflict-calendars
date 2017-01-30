require './lib/conflict/calendars'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # other config options here...    

end

describe 'Ccs::Calendar' do
  let(:calendar_A) { Ccs::Calendar.new("...",Time.new(2016,12,10,8,0),Time.new(2016,12,10,13,0)) }
  let(:calendar_B) { Ccs::Calendar.new(Time.new(2016,12,10,9,0),Time.new(2016,12,10,10,30)) }
  let(:calendar_C) { Ccs::Calendar.new(Time.new(2016,12,10,10,0),Time.new(2016,12,10,12,30))  }
  let(:calendar_D) { Ccs::Calendar.new(Time.new(2016,12,10,15,0),Time.new(2016,12,10,17,30)) }
  let(:calendar_E) { Ccs::Calendar.new(Time.new(2016,12,10,15,20),Time.new(2016,12,10,16,30)) }
  let(:conflicts) { Ccs::Conflicts.new(calendar_A,calendar_B,calendar_C,calendar_D,calendar_E) }             
  it 'size eq 2' do
    expect(conflicts.size).to eq(2)
    conflicts.each do |conflict|
        p conflict
    end
  end
end
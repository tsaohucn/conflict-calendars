require "./lib/conflict/calendars"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # other config options here...    

end

describe "Ccs::Calendar" do
  let(:calendar_A) { Ccs::Calendar.new("...","2016-12-10 08:00", "2016-12-10 13:00") }
  let(:calendar_B) { Ccs::Calendar.new("2016-12-10 09:00", "2016-12-10 10:30") }
  let(:calendar_C) { Ccs::Calendar.new("2016-12-10 10:00", "2016-12-10 12:30") }
  let(:calendar_D) { Ccs::Calendar.new("2016-12-10 15:00", "2016-12-10 17:30") }
  let(:calendar_E) { Ccs::Calendar.new("2016-12-10 15:20", "2016-12-10 16:30") }
  let(:conflicts) { Ccs::Conflicts.new(calendar_A,calendar_B,calendar_C,calendar_D,calendar_E) }

  it "reduce 2 set conflicts" do
    expect(conflicts.size).to eq(2)
  end

  it "first set has three conflicts" do
    expect(conflicts.first.size).to eq(3)
  end

end
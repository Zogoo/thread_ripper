RSpec.describe ThreadRipper do
  it "has a version number" do
    expect(ThreadRipper::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(ThreadRipper.call).to eq(0)
  end
end
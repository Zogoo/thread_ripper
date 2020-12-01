RSpec.describe ThreadRipper do
  describe "ThreadRipper module" do
    it "has a version number" do
      expect(ThreadRipper::VERSION).not_to be nil
    end
  end

  describe "ThreadSpawn" do
    context "#create_thread" do
      it "will return integer thread id" do
        expect(ThreadRipper::ThreadSpawn.create_thread).to be_kind_of(Integer)
      end
    end
  end
end

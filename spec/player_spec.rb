require_relative '../lib/player.rb'

describe Player do
  describe '#name' do
    it "returns a player's name" do
      player = Player.new("Player 1")
      expect(player.name).to eq("Player 1")
    end
  end

  describe '#hit_points' do
    it "returns players HP" do
      player_1 = Player.new('Player 1')
      expect(player_1.hit_points).to eq 100
    end
  end

  describe '#receive damage' do
    it "reduces opponents HP" do
      player_2 = Player.new("Player 2")
      expect { player_2.receive_damage }.to change { player_2.hit_points }.by(-10)
    end
  end
end

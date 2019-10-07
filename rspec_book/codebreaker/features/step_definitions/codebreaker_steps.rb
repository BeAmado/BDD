class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

class Singleton
  def self.output
    @@instance ||= Output.new
  end
end

Given 'I am not yet playing' do
end

When 'I start a new game' do
  game = Codebreaker::Game.new(Singleton.output)
  game.start
end

Then 'I should see {string}' do |message|
  expect(Singleton.output.messages).to include(message)
end

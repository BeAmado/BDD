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

########### Scenario start game ##########################
Given 'I am not yet playing' do
end

When 'I start a new game' do
  game = Codebreaker::Game.new(Singleton.output)
  game.start('1234')
end

Then 'I should see {string}' do |message|
  expect(Singleton.output.messages).to include(message)
end
##########################################################

######### Scenarios submit guess #########################
Given 'the secret code is {string}' do |secret|
  @game = Codebreaker::Game.new(Singleton.output)
  @game.start(secret)
end

When 'I guess {string}' do |guess|
  @game.guess(guess)
end

Then 'the mark should be {string}' do |mark|
  expect(Singleton.output.messages).to include(mark)
end
#########################################################

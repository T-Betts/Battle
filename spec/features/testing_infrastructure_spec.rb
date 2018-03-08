require 'spec_helper'
require_relative '../../lib/game.rb'

feature 'Entering names' do
  scenario 'Can enter player names and see them on screen' do
    sign_in_and_play
    expect(page).to have_content('Player A vs Player B')
  end
end

feature 'Viewing player hit points' do
  scenario 'Show player 2 remaining hit points' do
    sign_in_and_play
    expect(page).to have_content('Player B HP: 100')
  end

  scenario 'Show Player 1 remaining hit points' do
    sign_in_and_play
    expect(page).to have_content('Player A HP: 100')
  end
end

feature 'Attacking players' do
  scenario 'Player 1 attacks Player 2 and gets confirmation' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content('Player A attacked Player B')
  end

  scenario 'Player 1 attacks Player 2 and reduces Player 2 HP by 10' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content('Player B HP: 90')
  end
  #
  # scenario 'Player 2 attacks Player 1 and gets confirmation' do
  #   sign_in_and_play
  #   click_link('Attack')
  #   expect(page).to have_content('Player B attacked Player A')
  # end

  scenario 'Player 2 attacks Player 1 and reduces Player 1 HP by 10' do
    game = Game.new("Player A", "Player B")
    sign_in_and_play
    click_link('Attack')
    click_button('Next Round')
    click_link('Attack')
    expect(page).to have_content('Player A HP: 90')
  end

feature 'Switching turns' do
  scenario 'show current turn' do
    sign_in_and_play
    expect(page).to have_content("Player A's turn")
  end

  scenario 'swithces turn after player action' do
    sign_in_and_play
    click_link('Attack')
    expect(page).not_to have_content("Player A's turn")
    expect(page).to have_content("Player B, it's your turn now!")
  end
end
end

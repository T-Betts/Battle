def sign_in_and_play
  visit('/')
  fill_in('Player_1', with: 'Player A')
  fill_in('Player_2', with: 'Player B')
  click_button('Submit')
end

# Hangman (Command Line Game)

This project is a command-line Hangman game built in Ruby. The player tries to guess a randomly selected word while the game tracks their correct and incorrect guesses. The game also allows saving and loading a previous game using serialization.

## Features

- Randomly selects a word from a dictionary (between 5 and 12 characters long).
- Tracks correct and incorrect guesses.
- Displays player's progress.
- Allows saving and loading of game state.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/hangman_project.git
   ```

2. Navigate to the project directory:

   ```bash
   cd hangman_project
   ```

3. Ensure that you have Ruby installed on your system (version 2.7 or higher).

4. Download the `google-10000-english-no-swears.txt` file and place it in the project root directory.

## How to Play

1. Run the game from the command line:

   ```bash
   ruby main.rb
   ```

2. At the start, you will be asked if you'd like to load a saved game. If you choose "yes," the game will load from the last saved state.

3. The game will randomly select a word, and you will be prompted to guess letters.

4. Type a single letter and press enter. The game will tell you if your guess was correct or incorrect.

5. If you want to save your progress, type `save` instead of a letter during your turn.

6. The game ends when you guess the word or run out of allowed incorrect guesses.

## Save & Load Functionality

- You can save your progress at any time by typing `save` when prompted to enter a letter.
- When starting the game, you will be given the option to load a previously saved game.

## Future Features

- Add a `Player` class to handle player-specific logic (e.g., tracking statistics).
- Option to play as either player or computer.

## License

This project is open-source and available under the MIT License.
